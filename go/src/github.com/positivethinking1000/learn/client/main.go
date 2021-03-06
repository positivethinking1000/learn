/*
 *
 * Copyright 2015 gRPC authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package main

import (
	"log"
	"os"

	"golang.org/x/net/context"
	"google.golang.org/grpc"
//	pb "google.golang.org/grpc/examples/helloworld/helloworld"
	pb "github.com/positivethinking1000/learn/protob"
)

const (
	defaultAddress     = "localhost:50052"
	defaultName = "Jon Snow"
)

func main() {
	// Set up a connection to the server.
	address := defaultAddress
        name := defaultName
	if len(os.Args) > 2 {
                address = os.Args[1]
		name = os.Args[2]
	}

        conn, err := grpc.Dial(address, grpc.WithInsecure())
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()
	c := pb.NewIntroClient(conn)

	r, err := c.Intro(context.Background(), &pb.IntroRequest{IntroPerson: name})
	if err != nil {
		log.Fatalf("could not greet: %v", err)
	}
	log.Printf("Greeting: %s", r.IntroMachine)
}


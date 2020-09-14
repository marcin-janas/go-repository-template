package main

import (
	"testing"
)

func TestF(t *testing.T) {
	tests := []struct {
		name string
		give string
		want bool
	}{
		{
			name: "check f with correct parameters",
			give: "Go",
			want: true,
		},
		{
			name: "check f with incorrect parameters",
			give: "C++",
			want: false,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := f(tt.give); got != tt.want {
				t.Errorf("f() = %v, want %v", got, tt.want)
			}
		})
	}
}

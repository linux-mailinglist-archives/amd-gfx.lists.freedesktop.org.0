Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ACFA64B0A
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Mar 2025 11:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309EF10E3E0;
	Mon, 17 Mar 2025 10:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=spasswolf@web.de header.b="cQH9KEvi";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout.web.de (unknown [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8622D10E13D
 for <amd-gfx@lists.freedesktop.org>; Sun, 16 Mar 2025 13:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1742130569; x=1742735369; i=spasswolf@web.de;
 bh=lSe4wSQ+lMQWbvhKXpf0Z+jC1oqAJywc3aUScK7L7rk=;
 h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=cQH9KEviBnLqvQKvN1GBSlN0VTOH3Tf5r3DzqFlZe6ktkXC/sT0FCo+epJ8PLXYT
 24w/ukkkH63DOx0pJr7oA0ME8tAEL279DR+43xIzwAG7bDy7dGqBakdiWtGenC6X3
 66xD9i4iAtDbVnW+f5FwXKxfjZNmQYcStIlAstCyrKbK/RDlVEBxcql+pg9rpzjxj
 MfqwGwW0Jxuc5+/MM9ma9739izHvs+16b+qIGNrt3gbUCGmRjDsVPFQOzJLHAU15q
 N4/wqVOjlemw25rE1fPmHyXKtJ+iJ9j4NZzN6zrORqj3Gvzsrqfa8NscsKhtHfgir
 Rr1zFLlD7SiXkkRIIQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MWi9q-1timDQ3A1g-00XM9B; Sun, 16
 Mar 2025 14:09:28 +0100
Message-ID: <9be36dfab79b17e108f71d51a6ebf39073e110c6.camel@web.de>
Subject: Re: commit 7ffb791423c7 breaks steam game
From: Bert Karwatzki <spasswolf@web.de>
To: Alex Deucher <alexdeucher@gmail.com>, Balbir Singh <balbirs@nvidia.com>
Cc: Ingo Molnar <mingo@kernel.org>, Kees Cook <kees@kernel.org>, Bjorn
 Helgaas	 <bhelgaas@google.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Andy Lutomirski <luto@kernel.org>, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, spasswolf@web.de
Date: Sun, 16 Mar 2025 14:09:26 +0100
In-Reply-To: <CADnq5_Pvmxa10dJWYjajwxG-0Y_oxhL6wS6NsG2F0dmcJS6o8A@mail.gmail.com>
References: <20250310112206.4168-1-spasswolf@web.de>
 <951f9d13-72e4-41c3-9ace-8639e2a9485d@nvidia.com>
 <ce940e2a-632d-41be-9f13-e5b11d49b0db@nvidia.com>
 <09131c563332c892284ec7fb4ce706996131db8c.camel@web.de>
 <9a5df5627d3d72b2a97f501dfb7d944cc1e9920f.camel@web.de>
 <fdea59fe-f570-489f-bf88-1ffd47119cac@nvidia.com>
 <414f4deb8c7670a159854006b0c410ce05a6049e.camel@web.de>
 <12d950ee-4152-4ad6-b93e-7c5b75804b1a@nvidia.com>
 <705e95cec3dc5181ca2aa73722e6b84f63f3e91d.camel@web.de>
 <20b5823e-247a-456a-bb55-d50f212a9f5a@nvidia.com>
 <a34a1ae0b1d226b1bac7d73daa24da8e5899cb3e.camel@web.de>
 <c7bb0bd1-529d-466d-9cce-abbac4b480ab@nvidia.com>
 <146277bb0ecbb392d490683c424b8ae0dfa82838.camel@web.de>
 <b63b1de8-7eec-4235-b61e-e654e78543ba@nvidia.com>
 <fa8d5e76694918bdaae9faee9648776f298f78ca.camel@web.de>
 <7866593f-0322-4fb3-9729-82366940fc85@nvidia.com>
 <a168e78b-ae27-4675-8821-0b1a2499b2b2@nvidia.com>
 <5d34bfc5109b8d104fd4f8550dd17945344f9d07.camel@web.de>
 <551b9797-20d6-4bfe-b54c-84dd7aae7794@nvidia.com>
 <CADnq5_Pvmxa10dJWYjajwxG-0Y_oxhL6wS6NsG2F0dmcJS6o8A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.55.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1ziCuTaJLlr4/NNT3PlCqR0n3Z6k+RO4XmQJ9tGibHYEfS1WmQs
 Alsz8CYX0Jw/w3N/csNYOq9YTUaLDBnQAZeKQT3PBSRZz2QbfqKrbyGnGRIBWgQj71Lgdyh
 C9/jsYywMlniLJOyzLjyqg+Jl51vs4dxDHrXg0J/bgfnXTokYqiqxmEcEcqkWBZOmKWJafO
 70xtHET54OH4ZCDOu4IuA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vcRBeoKbmhg=;0ppaj85vFzT3WQfDA9cwKWGHHRY
 vq2S9rG3y3+HBNTo8SnKsc0PZ7VX12vX9hUKZ7FkqfC6TvAndZKKqsNpI93/+X8HXILh6aRkH
 2aoDH+Uige0ZYw1n3lnZFZ5CPlWERGiZtPUZUWrDJMmTI/UIDFGFnC7DvVNIpqq2ttlGR+Yku
 Wf1u+Y7S8lc0bieIPqhkqgbJwtD/PVR2V8l14d4h/vbckIbRJ+X04+4yBdAkwS+yrt+qi/Uof
 Tas0VqLni3mL3x3w7Wnq7/iMbqPeXhFOg1XRegn7N4ddiK6THDWd4z9voDWE6/xEoZtKfakN+
 TTIoXjUpzozfZiB9mGo7jfW7wAobbgGlra1n5KYCEmuJcmL42C638yPzHn8teodGjh3g8HZ2r
 jjyRnnES5lW5GbAI/q/YhkBRMjWPRO4nftJgsbJ/s1aBeWWIB0LrsonKPd31KjwEWbeWWhmJE
 qJ+7qgA8mxZGHNHNJGQdOGzVtFlGEjMb1airIU3TZGTcLY9AygZQsgr+TDvXBaSfa1n7hLYjz
 p68JHQXfT4je7rFl5VpIBU03bS6TXULe4W6qOXakUD6gpwjCKyqqYvzdO4VG98DSkGnpa6x2U
 U0Q+fu3aTYK0DRpNQoKHgywmHvrsCqIWGK+7cP3e2W0S+SCK2OTT69U50OBT8rwdAf+b+lVQD
 LEomU2bkOKzkDmj06coAtmXr4mpA9hY8fL6jl81EWEfbgRk7A2Xd3YOlmKo72d+iuIo+FO5b4
 xF35UFiSZa6YtUZr4J1tXYWFJG15HYNVhDAo3dcFVLqqxecwnGbQGyevdDNu3wIutMHZBCUq2
 XSTZN0foRj7F3z9qm+9k6FXfBGlIBTxJbm7IDivn6K9fuhDZdaGALBAQdwhACDt1RR9wTxia6
 NJPWwsKC52UUdS67gqjG171M26Rui9xJUcw+dc7pNPX1phnAujIGSs7Kdt4Yw2OQaUfe7mMMx
 UsezZW38nWUQnZ8D+E8+TdpJasyIBlX5AlFs3xBMMgprkxcV3piHamNP8X8Z2r+BywFPhNoWN
 fvW8RUerkeGnTkQJWMTQpS8MS71gbvMRBG6jyZr56o8O6TecQc3KG1koBGn6e76GuvHWQnkiY
 oRJYmnoBRMqhYSO8XBII8C0iRGfeQstuLhfPEVgp2efeFfsJT3eaTtBNl4dcsoaCixDrNpiMA
 xSY7UfE9Gon50zUKe0s58DYdmIiuT5wkRk6wGEScUjs4B8wCh1VInsKpULOCm1T+sP+BIlgBX
 Lr6qIiloMTGon2paHtPmh4mC1W4SFdE/SLBL8zQRKn6fUZ1nqeEv/+Ou5JNCEF+Ozv+DjLRbr
 v0b7WkLrgAfvzs1+sXQH9EyC/ijJyVQsci0+OJev3igGNwVES+AbIc5dzuMW/eOYKkqpr6SR5
 mFm49EeAIO1as4OZ1wgBttE7pVsEbRSbZgByDXTbv92O4EDEfRNaJvQht2myafjA9TSRgzAAy
 GjXD6fg==
X-Mailman-Approved-At: Mon, 17 Mar 2025 10:53:32 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is related to the admgpu.gttsize. My laptop has the maximum amount=C2=
=A0
of memory (64G) and usually gttsize is half of main memory size. I just=C2=
=A0
tested with cmdline=3D"nokaslr amdgpi.gttsize=3D2048" and the problem does=
=C2=A0
not occur. So I did some more testing with varying gttsize and got this
for the built-in GPU

08:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] (rev c5)

(nokaslr is always enabeld)
gttssize   input behaviour
 2048		GOOD
 2064		GOOD
 2080		SEMIBAD (i.e. noticeable input lag but not as bad as below)
 3072		BAD
 4096		BAD
 8192		BAD
16384		BAD

As the build-in GPU has ~512 VRAM there seems to be problems when gttsize =
>
4*VRAM so I tested for the discrete GPU with 8G of VRAM
gttsize   input behaviour
49152		GOOD
64000		GOOD

So for the discrete GPU increasing gttsize does no reproduce the bug.

Bert Karwatzki

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F96DAF89
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 16:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FFC6E492;
	Thu, 17 Oct 2019 14:14:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93746E492
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 14:14:19 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r5so2524154wrm.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 07:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5sbjuWO61NchDsTlHwM38uJWM4f58+wf14djMdIJSwE=;
 b=VdbGqbsGuy+xZEPum+f2hytlk0LGVJw+8oOzcXnWcb9NVPEBikVJNyQ6gFG9rEbAjw
 HAGunFYVj81eeIXhvuARi7HVIZ93V3RM4F0UIg0z7jwbjCN0xH+E0lWAO1wkdij+yU4t
 1YV6yQX2uZj3ZekN7gYPjoPnxZs+l5pjuRIz7kbhyLlNRXywgRT69A1/E3Y5efmzrsH9
 PDnOcJeBBTcWsHJTinS/0NCXOWvrmRpOkCNsY6FedO9rc9BNg7b6ETttGTjfhZHjYm3D
 RY5gyJluDkSBjbpFw0aw1W+8xpdDNDSHx8q7D/5OM4aRs++6MAAGLqC3t2pg+Usup0Tx
 pF2g==
X-Gm-Message-State: APjAAAUYo1U561w40a9H0lOZXtyVABXsihGHn/y1SoC6FLqIN9YHv7U0
 JlXzwx36uWzD2ZVCZbh9YZnn3b2wupd80PEejv1ASA==
X-Google-Smtp-Source: APXvYqwvXGIoL9g444icqqCF1ydcCnsTz4xqi9fZhNTjLuqj/2MSlk7MQird7NRJCuXwwu656rvD2cvzwyw35dsVhi4=
X-Received: by 2002:a5d:6ac3:: with SMTP id u3mr3434183wrw.206.1571321658361; 
 Thu, 17 Oct 2019 07:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAHL+j0_2ir=8hHDoyqizweOUSV6XfqC-UCD15WuJ9vvptNLr0g@mail.gmail.com>
In-Reply-To: <CAHL+j0_2ir=8hHDoyqizweOUSV6XfqC-UCD15WuJ9vvptNLr0g@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Oct 2019 10:14:06 -0400
Message-ID: <CADnq5_N0r8O2vQapGaary0L-OfdTdz-ezcMJK90+Gy2sPujYcw@mail.gmail.com>
Subject: Re: Spontaneous reboots when using RX 560
To: Sylvain Munaut <246tnt@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5sbjuWO61NchDsTlHwM38uJWM4f58+wf14djMdIJSwE=;
 b=eFlmz+Cc/iyHbXHkAXIj68ruxlnVBsf98KcJ0Fh2PM16KZftNDqUhWDo0orGx27qov
 neso4BKJT+GpzwFmJMCn/lGDEiSxrKfiLF8kqQ+/M1Rw9AY+Mh6FoZdwy3jBBJZ2rlTO
 y2Epv2ZvzWoPrEiC3KTVvt9PEMWoNDiLzIAQbQTPsyhjz65m8ZZT1Kk8qr7D65PK9ZBT
 F3SkO0UH3zMlwcaYqCpcFqu1ntsG2vdd9c9ca0ur51W02s+Gw6aW+dw2h5hjfmMhU57d
 +0q1I3QUBVCDPX0nXp6r//cvNBmoL87eCPqyP25L8YM/Hkb/FkR6MYvx26qE5USrxTs6
 iMiQ==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTA6MTEgQU0gU3lsdmFpbiBNdW5hdXQgPDI0NnRudEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gSEksCj4KPiBJIGhhdmUgUlggNTYwIDJHIGNhcmQuIEl0J3Mg
cGx1Z2dlZCBpbnRvIGEgMTZ4IHBoeXNpY2FsIC8gNHgKPiBlbGVjdHJpY2FsIHNsb3Qgb2YgYSBY
NTcwIGNoaXBzZXQgbW90aGVyYm9hcmQgd2l0aCBhIFJ5emVuIDM3MDBYIENQVS4KPiBUaGUgaGFy
ZHdhcmUgd29ya3MgZmluZSBhbmQgaXMgc3RhYmxlIHVuZGVyIFdpbmRvd3MgKHRlc3RlZCB3aXRo
Cj4gZ2FtZXMsIGJlbmNobWFya3MsIHN0cmVzcy10ZXN0cywgLi4uKQoKRG9lcyBib290aW5nIHdp
dGggcGNpPW5vYXRzIG9uIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIGluIGdydWIgZml4IHRoZSBp
c3N1ZT8KCkFsZXgKCj4KPiBCdXQgd2hlbiB0cnlpbmcgZm9yIGluc3RhbmNlIHN0ZWFtIHVuZGVy
IGxpbnV4LCBvciBldmVuIGp1c3QgdGhlICdhcHAKPiBsYXVuY2hlcicgZnJvbSB1YnVudHUgdGhh
dCBoYXMgc29tZSB2aXN1YWwgZWZmZWN0LCB0aGUgbWFjaGluZSB3aWxsCj4gaW5zdGFudGx5IHJl
Ym9vdC4KPiBBbHNvLCBhZnRlciB0aGUgcmVib290LCB0aGUgR1BVIGlzIG5vIGxvbmdlciBkZXRl
Y3RlZCAobHNwY2kgZG9lc24ndAo+IHNob3cgaXQsIGFuZCB1bmRlciB3aW5kb3dzLCBpdHMgbm8g
d2hlcmUgdG8gYmUgc2VlbiBlaXRoZXIpLiBJdCBuZWVkcwo+IHRvIGJlIHBoeXNpY2FsbHkgdHVy
bmVkIG9mZiBhbmQgdHVybmVkIGJhY2sgb24gZm9yIGl0IHRvIHdvcmsgYWdhaW4uCj4KPiBJIGFk
ZGVkIGEgc2VyaWFsIGNvbnNvbGUgdG8gdHJ5IHRvIGdldCBzb21lIG91dHB1dCBhbmQgd2hlbiBk
b2luZyB0aGF0Cj4gaXQgZG9lc24ndCBpbW1lZGlhdGVseSByZWJvb3QgKGJ1dCB0aGUgcmVzdCBp
cyB0aGUgc2FtZSwgbWFjaGluZSBpcwo+IHVudXNhYmxlIGFuZCBhIHJlYm9vdCB3aWxsIGhhdmUg
dGhlIEdQVSBub3QgcHJlc2VudCBhbnltb3JlIHVudGlsCj4gcG93ZXJvZmYpLgo+Cj4gVGhpcyBp
cyB0aGUgb3V0cHV0IEkgZ2V0IDoKPgo+IFsgIDE0NC4zMTE3MDRdIGFtZGdwdSAwMDAwOjA2OjAw
LjA6IEFNRC1WaTogRXZlbnQgbG9nZ2VkCj4gW0lPX1BBR0VfRkFVTFQgZG9tYWluPTB4MDAwMCBh
ZGRyZXNzPTB4YTA3NjAxMDEwMCBmbGFncz0weDAwMTBdCj4gWyAgMTQ0LjMyMjczNF0gYW1kZ3B1
IDAwMDA6MDY6MDAuMDogQU1ELVZpOiBFdmVudCBsb2dnZWQKPiBbSU9fUEFHRV9GQVVMVCBkb21h
aW49MHgwMDAwIGFkZHJlc3M9MHhhMDc2MjMwMTAwIGZsYWdzPTB4MDAxMF0KPiBbICAxNDQuMzMz
NzUxXSBhbWRncHUgMDAwMDowNjowMC4wOiBBTUQtVmk6IEV2ZW50IGxvZ2dlZAo+IFtJT19QQUdF
X0ZBVUxUIGRvbWFpbj0weDAwMDAgYWRkcmVzcz0weGEwNzYwMzAxMDAgZmxhZ3M9MHgwMDEwXQo+
IFsgIDE0Ny4wMjg2MjVdIEFNRC1WaTogQ29tcGxldGlvbi1XYWl0IGxvb3AgdGltZWQgb3V0Cj4g
WyAgMTQ3LjIwNjMzNl0gQU1ELVZpOiBDb21wbGV0aW9uLVdhaXQgbG9vcCB0aW1lZCBvdXQKPiBb
ICAxNDcuMzY4MjYwXSBBTUQtVmk6IENvbXBsZXRpb24tV2FpdCBsb29wIHRpbWVkIG91dAo+IFsg
IDE0Ny41MzIyOTZdIEFNRC1WaTogQ29tcGxldGlvbi1XYWl0IGxvb3AgdGltZWQgb3V0Cj4gWyAg
MTQ3LjcwMzI2OV0gQU1ELVZpOiBDb21wbGV0aW9uLVdhaXQgbG9vcCB0aW1lZCBvdXQKPiBbICAx
NDcuODQ1ODQwXSBBTUQtVmk6IENvbXBsZXRpb24tV2FpdCBsb29wIHRpbWVkIG91dAo+IFsgIDE0
Ny44NjA5NTBdIGlvbW11IGl2aGQwOiBBTUQtVmk6IEV2ZW50IGxvZ2dlZCBbSU9UTEJfSU5WX1RJ
TUVPVVQKPiBkZXZpY2U9MDY6MDAuMCBhZGRyZXNzPTB4ODFiMWMxZTYwXQo+IFsgIDE0OC4wMTU3
NzhdIEFNRC1WaTogQ29tcGxldGlvbi1XYWl0IGxvb3AgdGltZWQgb3V0Cj4gWyAgMTQ4LjE4NzI3
MF0gQU1ELVZpOiBDb21wbGV0aW9uLVdhaXQgbG9vcCB0aW1lZCBvdXQKPgo+IChhbmQgdGhlbiBp
dCBzZWVtIHRvIGluZmluaXRlbHkgbG9vcCBhbHdheXMgcHJpbnRpbmcgdGhhdCkuCj4KPiBJIHRy
aWVkIFVidW50dSAxOS4xMCB3aXRoIDUuMy4wLTE4LWdlbmVyaWMKPiBBbHNvIFVidW50dSAxOS4w
NCB3aXRoIDUuMC4wLTMxLWdlbmVyaWMKPiBBbHNvIHRyaWVkIHdpdGggYSBES01TIG1vZHVsZSBm
cm9tIDE5LjMwIEFNREdQVS1QUk8gcGF0Y2hlZCB0byBidWlsZAo+IGFuZCBsb2FkIHVuZGVyIDUu
My4wLCBhbGwgZ2l2ZSB0aGUgc2FtZSByZXN1bHQuCj4KPiBDaGVlcnMsCj4KPiAgICAgU3lsdmFp
biBNdW5hdXQKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

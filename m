Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC1448A4D1
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jan 2022 02:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473FF10E4DE;
	Tue, 11 Jan 2022 01:11:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8896010E4DE
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jan 2022 01:04:46 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id q25so52180941edb.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jan 2022 17:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mCOpiIyI/tBui+JQeCIG6BnI3TWJ884rrreuntXnX5g=;
 b=gJ+Krs9ZfsYYWfHJstnJMyZ+TuckUvKACUeXhv1vIZN0LXrbeDVREYrtUighH0VBV2
 3zTqPGD2RDoOBS9OknQ6frTomreDVYdtaU2U88Dy+g10Lhzziivf3BxS7uLLks1iG1qz
 QmfvMBGCQSabCj5T28wwl4nDeqgPJbWHod0gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mCOpiIyI/tBui+JQeCIG6BnI3TWJ884rrreuntXnX5g=;
 b=VoXX8waj8QRJGWOD88cYJy7zFGc4Uz+x9jMwtDQrHepGmqJ1tlFHyoGQShTcTtlRGE
 bNAkMu2GW6gsjGGhMXwKD/iWbFJCpW+1ZUjZNN4Mjd6wjA7F7ZGVtGXXMuMluGHGmUwR
 Wl8uvdtG7esysCvoq9QDjHWwnyef+NGwUano8Gbp4CSQtWlBYue0oZaI9sSzrh+/PN6K
 WgFrsIvwc3QiNepggxXEkG9KTEft17oOh6aV4Q+J8tRf9DeBzKkO0PVIr8QVsrTTHHtO
 iDA/zdWQqcDS83siklKFtcvFWqkfgXrhgrjon4mIQF0QtfjQMnBrY5YIgbHEn/xTxWfG
 gaJg==
X-Gm-Message-State: AOAM530uWQ5gOJ5Q8ZN7NgP4rYMVnoC+rmi3tBvJhxHcKNScLaHHBRfw
 t8FJPAQ8Ww7Yx0vDMlWpY8TihL63NZHuT5o7Yhc=
X-Google-Smtp-Source: ABdhPJyZKOLFt18D7pqkzq0+wGnW62cAiWHFsPTQqeeiBpK6ES5LPVeH7iZCZR2bo+3Z5QbmSzfubg==
X-Received: by 2002:aa7:cb08:: with SMTP id s8mr2170033edt.57.1641863084769;
 Mon, 10 Jan 2022 17:04:44 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id p3sm2963457ejo.61.2022.01.10.17.04.43
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 17:04:43 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id a5so26088840wrh.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jan 2022 17:04:43 -0800 (PST)
X-Received: by 2002:adf:c74e:: with SMTP id b14mr1698957wrh.97.1641863083155; 
 Mon, 10 Jan 2022 17:04:43 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
 <CAHk-=wg9hDde_L3bK9tAfdJ4N=TJJ+SjO3ZDONqH5=bVoy_Mzg@mail.gmail.com>
 <CAKMK7uEag=v-g6ygHPcT-uQJJx+5KOh2ZRzC2QtM-MCjjW67TA@mail.gmail.com>
 <CADnq5_P9n39RQ5+Nm8O=YKXXvXh1CEzwC2fOEzEJuS2zQLUWEw@mail.gmail.com>
In-Reply-To: <CADnq5_P9n39RQ5+Nm8O=YKXXvXh1CEzwC2fOEzEJuS2zQLUWEw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Jan 2022 17:04:26 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgDGcaRxUwRCR6p-rxDVO78Yj4YyM6ZsPRGiT2JOCoQ6A@mail.gmail.com>
Message-ID: <CAHk-=wgDGcaRxUwRCR6p-rxDVO78Yj4YyM6ZsPRGiT2JOCoQ6A@mail.gmail.com>
Subject: Re: [git pull] drm for 5.17-rc1 (pre-merge window pull)
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000d7915205d54409aa"
X-Mailman-Approved-At: Tue, 11 Jan 2022 01:11:50 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Wentland,
 Harry" <harry.wentland@amd.com>, Dave Airlie <airlied@gmail.com>, "Koenig,
 Christian" <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--000000000000d7915205d54409aa
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 2:13 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Sounds like something related to watermarks.  That said, we haven't
> really touched the display code for DCE11 cards in quite a while.  Can
> you provide your dmesg output?

I'm not seeing anything that would look interesting, but here's the
parts that look relevant for drm..

              Linus

--000000000000d7915205d54409aa
Content-Type: application/octet-stream; name=dmesg-gpu
Content-Disposition: attachment; filename=dmesg-gpu
Content-Transfer-Encoding: base64
Content-ID: <f_ky9evksc0>
X-Attachment-Id: f_ky9evksc0

WyAgICAwLjEwNzU3Nl0gc21wYm9vdDogQ1BVMDogQU1EIFJ5emVuIFRocmVhZHJpcHBlciAzOTcw
WCAzMi1Db3JlIFByb2Nlc3NvciAoZmFtaWx5OiAweDE3LCBtb2RlbDogMHgzMSwgc3RlcHBpbmc6
IDB4MCkKWyAgICAwLjEwNzY3OV0gUGVyZm9ybWFuY2UgRXZlbnRzOiBGYW0xN2grIGNvcmUgcGVy
ZmN0ciwgQU1EIFBNVSBkcml2ZXIuClsgICAgMS43NTQzODFdIHBjaSAwMDAwOjQ5OjAwLjA6IEJB
UiAwOiBhc3NpZ25lZCB0byBlZmlmYgpbICAgIDEuODIwMzQ5XSBlZmlmYjogcHJvYmluZyBmb3Ig
ZWZpZmIKWyAgICAxLjgyMDM1NV0gZWZpZmI6IHNob3dpbmcgYm9vdCBncmFwaGljcwpbICAgIDEu
ODIwODE5XSBlZmlmYjogZnJhbWVidWZmZXIgYXQgMHhkMDAwMDAwMCwgdXNpbmcgMzA3MmssIHRv
dGFsIDMwNzJrClsgICAgMS44MjA4MjBdIGVmaWZiOiBtb2RlIGlzIDEwMjR4NzY4eDMyLCBsaW5l
bGVuZ3RoPTQwOTYsIHBhZ2VzPTEKWyAgICAxLjgyMDgyMV0gZWZpZmI6IHNjcm9sbGluZzogcmVk
cmF3ClsgICAgMS44MjA4MjFdIGVmaWZiOiBUcnVlY29sb3I6IHNpemU9ODo4Ojg6OCwgc2hpZnQ9
MjQ6MTY6ODowClsgICAgMS44MjA4NDNdIGZiY29uOiBEZWZlcnJpbmcgY29uc29sZSB0YWtlLW92
ZXIKWyAgICAxLjgyMDg0NF0gZmIwOiBFRkkgVkdBIGZyYW1lIGJ1ZmZlciBkZXZpY2UKWyAgICAy
LjUzNzMxMV0gQUNQSTogYnVzIHR5cGUgZHJtX2Nvbm5lY3RvciByZWdpc3RlcmVkClsgICAgMi41
NDY1ODddIEFNRC1WaTogQU1EIElPTU1VdjIgbG9hZGVkIGFuZCBpbml0aWFsaXplZApbICAgIDIu
NjQwNDA1XSBbZHJtXSBhbWRncHUga2VybmVsIG1vZGVzZXR0aW5nIGVuYWJsZWQuClsgICAgMi42
NDA0NzldIGFtZGdwdTogSWdub3JpbmcgQUNQSSBDUkFUIG9uIG5vbi1BUFUgc3lzdGVtClsgICAg
Mi42NDA0ODRdIGFtZGdwdTogVmlydHVhbCBDUkFUIHRhYmxlIGNyZWF0ZWQgZm9yIENQVQpbICAg
IDIuNjQwNDkwXSBhbWRncHU6IFRvcG9sb2d5OiBBZGQgQ1BVIG5vZGUKWyAgICAyLjY0MDU5N10g
ZmIwOiBzd2l0Y2hpbmcgdG8gYW1kZ3B1IGZyb20gRUZJIFZHQQpbICAgIDIuNjQwNjM1XSBhbWRn
cHUgMDAwMDo0OTowMC4wOiB2Z2FhcmI6IGRlYWN0aXZhdGUgdmdhIGNvbnNvbGUKWyAgICAyLjY0
MDczM10gW2RybV0gaW5pdGlhbGl6aW5nIGtlcm5lbCBtb2Rlc2V0dGluZyAoUE9MQVJJUzEwIDB4
MTAwMjoweDY3REYgMHgxREEyOjB4RTM1MyAweEU3KS4KWyAgICAyLjY0MDczNV0gYW1kZ3B1IDAw
MDA6NDk6MDAuMDogYW1kZ3B1OiBUcnVzdGVkIE1lbW9yeSBab25lIChUTVopIGZlYXR1cmUgbm90
IHN1cHBvcnRlZApbICAgIDIuNjQwNzQyXSBbZHJtXSByZWdpc3RlciBtbWlvIGJhc2U6IDB4RTFD
MDAwMDAKWyAgICAyLjY0MDc0Ml0gW2RybV0gcmVnaXN0ZXIgbW1pbyBzaXplOiAyNjIxNDQKWyAg
ICAyLjY0MDc0Nl0gW2RybV0gYWRkIGlwIGJsb2NrIG51bWJlciAwIDx2aV9jb21tb24+ClsgICAg
Mi42NDA3NDddIFtkcm1dIGFkZCBpcCBibG9jayBudW1iZXIgMSA8Z21jX3Y4XzA+ClsgICAgMi42
NDA3NDddIFtkcm1dIGFkZCBpcCBibG9jayBudW1iZXIgMiA8dG9uZ2FfaWg+ClsgICAgMi42NDA3
NDhdIFtkcm1dIGFkZCBpcCBibG9jayBudW1iZXIgMyA8Z2Z4X3Y4XzA+ClsgICAgMi42NDA3NDhd
IFtkcm1dIGFkZCBpcCBibG9jayBudW1iZXIgNCA8c2RtYV92M18wPgpbICAgIDIuNjQwNzQ5XSBb
ZHJtXSBhZGQgaXAgYmxvY2sgbnVtYmVyIDUgPHBvd2VycGxheT4KWyAgICAyLjY0MDc0OV0gW2Ry
bV0gYWRkIGlwIGJsb2NrIG51bWJlciA2IDxkbT4KWyAgICAyLjY0MDc1MF0gW2RybV0gYWRkIGlw
IGJsb2NrIG51bWJlciA3IDx1dmRfdjZfMD4KWyAgICAyLjY0MDc1MF0gW2RybV0gYWRkIGlwIGJs
b2NrIG51bWJlciA4IDx2Y2VfdjNfMD4KWyAgICAyLjY0MDkyNl0gYW1kZ3B1IDAwMDA6NDk6MDAu
MDogTm8gbW9yZSBpbWFnZSBpbiB0aGUgUENJIFJPTQpbICAgIDIuNjQwOTQyXSBhbWRncHUgMDAw
MDo0OTowMC4wOiBhbWRncHU6IEZldGNoZWQgVkJJT1MgZnJvbSBST00gQkFSClsgICAgMi42NDA5
NDNdIGFtZGdwdTogQVRPTSBCSU9TOiAxMTMtNEUzNTNCVS1PNkIKWyAgICAyLjY0MDk1NF0gW2Ry
bV0gVVZEIGlzIGVuYWJsZWQgaW4gVk0gbW9kZQpbICAgIDIuNjQwOTU0XSBbZHJtXSBVVkQgRU5D
IGlzIGVuYWJsZWQgaW4gVk0gbW9kZQpbICAgIDIuNjQwOTU2XSBbZHJtXSBWQ0UgZW5hYmxlZCBp
biBWTSBtb2RlClsgICAgMi42NDA5NzddIFtkcm1dIHZtIHNpemUgaXMgMjU2IEdCLCAyIGxldmVs
cywgYmxvY2sgc2l6ZSBpcyAxMC1iaXQsIGZyYWdtZW50IHNpemUgaXMgOS1iaXQKWyAgICAyLjY0
MTkyOV0gYW1kZ3B1IDAwMDA6NDk6MDAuMDogYW1kZ3B1OiBWUkFNOiA4MTkyTSAweDAwMDAwMEY0
MDAwMDAwMDAgLSAweDAwMDAwMEY1RkZGRkZGRkYgKDgxOTJNIHVzZWQpClsgICAgMi42NDE5MzJd
IGFtZGdwdSAwMDAwOjQ5OjAwLjA6IGFtZGdwdTogR0FSVDogMjU2TSAweDAwMDAwMEZGMDAwMDAw
MDAgLSAweDAwMDAwMEZGMEZGRkZGRkYKWyAgICAyLjY0MTkzOF0gW2RybV0gRGV0ZWN0ZWQgVlJB
TSBSQU09ODE5Mk0sIEJBUj0yNTZNClsgICAgMi42NDE5MzhdIFtkcm1dIFJBTSB3aWR0aCAyNTZi
aXRzIEdERFI1ClsgICAgMi42NDE5NjFdIFtkcm1dIGFtZGdwdTogODE5Mk0gb2YgVlJBTSBtZW1v
cnkgcmVhZHkKWyAgICAyLjY0MTk2Ml0gW2RybV0gYW1kZ3B1OiA4MTkyTSBvZiBHVFQgbWVtb3J5
IHJlYWR5LgpbICAgIDIuNjQxOTY0XSBbZHJtXSBHQVJUOiBudW0gY3B1IHBhZ2VzIDY1NTM2LCBu
dW0gZ3B1IHBhZ2VzIDY1NTM2ClsgICAgMi42NDQ0NTFdIFtkcm1dIFBDSUUgR0FSVCBvZiAyNTZN
IGVuYWJsZWQgKHRhYmxlIGF0IDB4MDAwMDAwRjQwMDMwMDAwMCkuClsgICAgMi42NDYwMzNdIFtk
cm1dIENoYWluZWQgSUIgc3VwcG9ydCBlbmFibGVkIQpbICAgIDIuNjUxOTkwXSBhbWRncHU6IGh3
bWdyX3N3X2luaXQgc211IGJhY2tlZCBpcyBwb2xhcmlzMTBfc211ClsgICAgMi42NjU3NTVdIFtk
cm1dIEZvdW5kIFVWRCBmaXJtd2FyZSBWZXJzaW9uOiAxLjEzMCBGYW1pbHkgSUQ6IDE2ClsgICAg
Mi42NzE3NDddIFtkcm1dIEZvdW5kIFZDRSBmaXJtd2FyZSBWZXJzaW9uOiA1My4yNiBCaW5hcnkg
SUQ6IDMKWyAgICAzLjA0MjY2OF0gW2RybV0gRGlzcGxheSBDb3JlIGluaXRpYWxpemVkIHdpdGgg
djMuMi4xNjchClsgICAgMy4xMzAyODldIFtkcm1dIFVWRCBhbmQgVVZEIEVOQyBpbml0aWFsaXpl
ZCBzdWNjZXNzZnVsbHkuClsgICAgMy4yMzEyNDBdIFtkcm1dIFZDRSBpbml0aWFsaXplZCBzdWNj
ZXNzZnVsbHkuClsgICAgMy4yMzI2MThdIGtmZCBrZmQ6IGFtZGdwdTogQWxsb2NhdGVkIDM5Njkw
NTYgYnl0ZXMgb24gZ2FydApbICAgIDMuMjMyODA0XSBhbWRncHU6IFNSQVQgdGFibGUgbm90IGZv
dW5kClsgICAgMy4yMzI4MDRdIGFtZGdwdTogVmlydHVhbCBDUkFUIHRhYmxlIGNyZWF0ZWQgZm9y
IEdQVQpbICAgIDMuMjMyODU2XSBhbWRncHU6IFRvcG9sb2d5OiBBZGQgZEdQVSBub2RlIFsweDY3
ZGY6MHgxMDAyXQpbICAgIDMuMjMyODU5XSBrZmQga2ZkOiBhbWRncHU6IGFkZGVkIGRldmljZSAx
MDAyOjY3ZGYKWyAgICAzLjIzMjg3NV0gYW1kZ3B1IDAwMDA6NDk6MDAuMDogYW1kZ3B1OiBTRSA0
LCBTSCBwZXIgU0UgMSwgQ1UgcGVyIFNIIDksIGFjdGl2ZV9jdV9udW1iZXIgMzYKWyAgICAzLjIz
NjM1OV0gW2RybV0gSW5pdGlhbGl6ZWQgYW1kZ3B1IDMuNDQuMCAyMDE1MDEwMSBmb3IgMDAwMDo0
OTowMC4wIG9uIG1pbm9yIDAKWyAgICAzLjI0NDQxMl0gZmJjb246IGFtZGdwdWRybWZiIChmYjAp
IGlzIHByaW1hcnkgZGV2aWNlClsgICAgMy4yNDQ0MTVdIGZiY29uOiBEZWZlcnJpbmcgY29uc29s
ZSB0YWtlLW92ZXIKWyAgICAzLjI0NDQxNl0gYW1kZ3B1IDAwMDA6NDk6MDAuMDogW2RybV0gZmIw
OiBhbWRncHVkcm1mYiBmcmFtZSBidWZmZXIgZGV2aWNlClsgIDM1My45MzgxNjNdIHN5c3RlbWRb
MV06IFN0YXJ0aW5nIExvYWQgS2VybmVsIE1vZHVsZSBkcm0uLi4KWyAgMzUzLjk0OTIxNl0gc3lz
dGVtZFsxXTogbW9kcHJvYmVAZHJtLnNlcnZpY2U6IERlYWN0aXZhdGVkIHN1Y2Nlc3NmdWxseS4K
WyAgMzUzLjk0OTMxMl0gc3lzdGVtZFsxXTogRmluaXNoZWQgTG9hZCBLZXJuZWwgTW9kdWxlIGRy
bS4KWyAgMzU0LjEzMzMxNl0gc25kX2hkYV9pbnRlbCAwMDAwOjQ5OjAwLjE6IGJvdW5kIDAwMDA6
NDk6MDAuMCAob3BzIGFtZGdwdV9kbV9hdWRpb19jb21wb25lbnRfYmluZF9vcHMgW2FtZGdwdV0p
Cg==
--000000000000d7915205d54409aa--

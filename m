Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7262048B012
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jan 2022 16:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F8C10FBDA;
	Tue, 11 Jan 2022 15:00:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF67110F28B
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jan 2022 02:44:23 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id i5so7852772edf.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jan 2022 18:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e6DyqGEc7jzs2DrDJmcf97NoOyRv5WUpu09hjtDmwco=;
 b=hJDeHn78W2/WOsFsir7PnHTW5K5JqwfeQEbtREyhNP3YkXeJuuNPxsJMMuRVOKNERO
 4IztEvTJ3tkQNP3fGimMcyk9S/2AQPl4EDMEx1um2swdGTRBh8PwZNj2XMMmdXxYBMHW
 UYc2haQhH/vma0IrvqX+M2q9fjcFBdSlgcbqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e6DyqGEc7jzs2DrDJmcf97NoOyRv5WUpu09hjtDmwco=;
 b=z1dcXeCuLi2QFvG6L45UuPzdcKPLQ/QSuJlx1qw0UzPm8P0RIfyDKGnzOAAEW4EMjJ
 JfVxEjKUQeeWHjOQQyvU2Y1ttob4KaxAgNmUetQWkTszDvVDmiTyonq/nG/O81d8lOjR
 zLF9vfBjcbUzZnmZB9IQAQEDeltYw0Rx8DlMCftpBQwICg59dDbu3ZQ3mD5+hFnEq6dp
 EeTYBju1/+wLcsv9gpsBHTjJZHftXUuBG/qUPTXLgi00dlFWkO5Im58FUBJq49Cd0Jcc
 lPUX2BnU+J94x7EJb/GpIUbjXCgb5JF+dFdBuTz/w4j+zUVoOF3M/kHra1ITf9uyub53
 cblw==
X-Gm-Message-State: AOAM533tO1xvpFsYJYzBQK4tV349TiJtyqaYDtaWOWmPAcu53Gt8c0Wn
 Z9GfIcr8cjw5DCPxRrsGOKogOLmCaS2WV8BBd+Q=
X-Google-Smtp-Source: ABdhPJzlxInTevlqokhuZWxZlibgXl5Ls0K4vmx00iYvelsXFWf9qlWmpkkAQrvAxdm8onC3/WmZCw==
X-Received: by 2002:a17:907:1687:: with SMTP id
 hc7mr1923285ejc.565.1641869062029; 
 Mon, 10 Jan 2022 18:44:22 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52])
 by smtp.gmail.com with ESMTPSA id qw28sm1459209ejc.154.2022.01.10.18.44.21
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 18:44:21 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so577318wmk.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jan 2022 18:44:21 -0800 (PST)
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr521503wmq.152.1641869060707; 
 Mon, 10 Jan 2022 18:44:20 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
 <CAHk-=wg9hDde_L3bK9tAfdJ4N=TJJ+SjO3ZDONqH5=bVoy_Mzg@mail.gmail.com>
 <CAKMK7uEag=v-g6ygHPcT-uQJJx+5KOh2ZRzC2QtM-MCjjW67TA@mail.gmail.com>
 <CADnq5_P9n39RQ5+Nm8O=YKXXvXh1CEzwC2fOEzEJuS2zQLUWEw@mail.gmail.com>
 <CAHk-=wgDGcaRxUwRCR6p-rxDVO78Yj4YyM6ZsPRGiT2JOCoQ6A@mail.gmail.com>
 <CADnq5_OYO7kq+9DBnDvbSfpouFvdLB0LPSL6+f1ZPRBsV=qEqA@mail.gmail.com>
 <CAHk-=wiCCRG9Lwzr+Cur=K1V2GJ9ab_ket7EnG4RZhJ8jJM7xQ@mail.gmail.com>
 <CAHk-=wi8b-YKHeNfwyYHMcgR2vJh4xpSZ0qjkv8E8Y9V8Sv2Tg@mail.gmail.com>
In-Reply-To: <CAHk-=wi8b-YKHeNfwyYHMcgR2vJh4xpSZ0qjkv8E8Y9V8Sv2Tg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Jan 2022 18:44:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=whnWnB9yjVaqWNKjavSJxDOEbTAPwef=O7qjL8nKZgV6A@mail.gmail.com>
Message-ID: <CAHk-=whnWnB9yjVaqWNKjavSJxDOEbTAPwef=O7qjL8nKZgV6A@mail.gmail.com>
Subject: Re: [git pull] drm for 5.17-rc1 (pre-merge window pull)
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: multipart/mixed; boundary="00000000000021eae505d5456e24"
X-Mailman-Approved-At: Tue, 11 Jan 2022 15:00:28 +0000
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

--00000000000021eae505d5456e24
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 6:22 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> and I guess I'll do the few more bisections to pick out the exact one.

a896f870f8a5f23ec961d16baffd3fda1f8be57c is the first bad commit.

Attaching ther BISECT_LOG in case anybody cares.

I'll double-check to see if a revert fixes it at the top of my tree.

                Linus

--00000000000021eae505d5456e24
Content-Type: application/octet-stream; name=BISECT_LOG
Content-Disposition: attachment; filename=BISECT_LOG
Content-Transfer-Encoding: base64
Content-ID: <f_ky9i2ijq0>
X-Attachment-Id: f_ky9i2ijq0

Z2l0IGJpc2VjdCBzdGFydAojIGJhZDogWzhkMDc0OWI0ZjgzYmY0NzY4Y2VhZTQ1ZWU2YTc5ZTZl
N2VkZGZjMmFdIE1lcmdlIHRhZyAnZHJtLW5leHQtMjAyMi0wMS0wNycgb2YgZ2l0Oi8vYW5vbmdp
dC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybQpnaXQgYmlzZWN0IGJhZCA4ZDA3NDliNGY4M2JmNDc2
OGNlYWU0NWVlNmE3OWU2ZTdlZGRmYzJhCiMgZ29vZDogW2JmNGVlYmY4Y2ZhMmNkNTBlMjBiNzMy
MWRmYjNlZmZkY2RjNmU5MDldIE1lcmdlIHRhZyAnbGludXgta3NlbGZ0ZXN0LWt1bml0LTUuMTct
cmMxJyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc2h1
YWgvbGludXgta3NlbGZ0ZXN0CmdpdCBiaXNlY3QgZ29vZCBiZjRlZWJmOGNmYTJjZDUwZTIwYjcz
MjFkZmIzZWZmZGNkYzZlOTA5CiMgZ29vZDogWzE1YmI3OTkxMGZlNzM0YWQyMWM3NjVkMWNhZTc2
MmU4NTU5NjljYWFdIE1lcmdlIHRhZyAnZHJtLW1pc2MtbmV4dC0yMDIxLTEyLTA5JyBvZiBnaXQ6
Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MgaW50byBkcm0tbmV4dApnaXQg
YmlzZWN0IGdvb2QgMTViYjc5OTEwZmU3MzRhZDIxYzc2NWQxY2FlNzYyZTg1NTk2OWNhYQojIGJh
ZDogW2IwNjEwM2I1MzI1MzY0ZTBiOTk0NDAyNGRiNDFiNDAwYjkwMjhkZjldIE1lcmdlIHRhZyAn
YW1kLWRybS1uZXh0LTUuMTctMjAyMS0xMi0xNicgb2YgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2FnZDVmL2xpbnV4IGludG8gZHJtLW5leHQKZ2l0IGJpc2VjdCBiYWQgYjA2MTAzYjUz
MjUzNjRlMGI5OTQ0MDI0ZGI0MWI0MDBiOTAyOGRmOQojIGdvb2Q6IFtlYWNlZjlmZDYxZGNmNWVh
YzhiNzc1YmIxODE0MDQyZTc4YTVjNDJkXSBNZXJnZSB0YWcgJ2RybS1pbnRlbC1uZXh0LTIwMjEt
MTItMTQnIG9mIHNzaDovL2dpdC5mcmVlZGVza3RvcC5vcmcvZ2l0L2RybS9kcm0taW50ZWwgaW50
byBkcm0tbmV4dApnaXQgYmlzZWN0IGdvb2QgZWFjZWY5ZmQ2MWRjZjVlYWM4Yjc3NWJiMTgxNDA0
MmU3OGE1YzQyZAojIGJhZDogWzJjYjY1NzdhMzAzNDI1MDkwZjNiNWY0YzQwMDk2ZDQ1YTkwNDg4
NzVdIGRybS9hbWRncHU6IHJlYWQgYW5kIGF1dGhlbnRpY2F0ZSBpcCBkaXNjb3ZlcnkgYmluYXJ5
CmdpdCBiaXNlY3QgYmFkIDJjYjY1NzdhMzAzNDI1MDkwZjNiNWY0YzQwMDk2ZDQ1YTkwNDg4NzUK
IyBiYWQ6IFthYjUwY2I5ZGY4ODk2YjM5YWFlNjVjNTM3YTMwZGUyYzc5YzE5NzM1XSBkcm0vcmFk
ZW9uL3JhZGVvbl9rbXM6IEZpeCBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBpbiByYWRlb25f
ZHJpdmVyX29wZW5fa21zKCkKZ2l0IGJpc2VjdCBiYWQgYWI1MGNiOWRmODg5NmIzOWFhZTY1YzUz
N2EzMGRlMmM3OWMxOTczNQojIGJhZDogWzk2MDIwNDRkMWNjMTIyODBlMjBjODg4ODVmMmNkNjQw
YWU4MGY2OWVdIGRybS9hbWQvZGlzcGxheTogRml4IGZvciB0aGUgbm8gQXVkaW8gYnVnIHdpdGgg
VGlsZWQgRGlzcGxheXMKZ2l0IGJpc2VjdCBiYWQgOTYwMjA0NGQxY2MxMjI4MGUyMGM4ODg4NWYy
Y2Q2NDBhZTgwZjY5ZQojIGdvb2Q6IFszODY3ZTM3MDRmMTM2YmVhZGY1ZTAwNGI2MTY5NmVmN2Y5
OTBiZWU0XSBhbWRncHUvcG06IENyZWF0ZSBzaGFyZWQgYXJyYXkgb2YgcG93ZXIgcHJvZmlsZSBu
YW1lIHN0cmluZ3MKZ2l0IGJpc2VjdCBnb29kIDM4NjdlMzcwNGYxMzZiZWFkZjVlMDA0YjYxNjk2
ZWY3Zjk5MGJlZTQKIyBnb29kOiBbNTBiMWY0NGVjNTQ3NDZlNTMzMmY0YmM4N2M3MGMyMjMxOTJl
ODIxZl0gZHJtL2FtZC9kaXNwbGF5OiBBZGQgRFAtSERNSSBGUkwgUENPTiBTU1QgU3VwcG9ydCBp
biBETQpnaXQgYmlzZWN0IGdvb2QgNTBiMWY0NGVjNTQ3NDZlNTMzMmY0YmM4N2M3MGMyMjMxOTJl
ODIxZgojIGdvb2Q6IFs2NDIxZjdjNzUwZTkyYzM1Y2ViMjM5Y2NiZDAzY2VlYWUyYzY1ZmY4XSBk
cm0vYW1kL2Rpc3BsYXk6IEFsbG93IERTQyBvbiBzdXBwb3J0ZWQgTVNUIGJyYW5jaCBkZXZpY2Vz
CmdpdCBiaXNlY3QgZ29vZCA2NDIxZjdjNzUwZTkyYzM1Y2ViMjM5Y2NiZDAzY2VlYWUyYzY1ZmY4
CiMgZ29vZDogW2FiYTNjM2ZlZGU1NGU1NTU3Mzk1NGZhN2E3ZTI4ZWMzMDQ1NTdlNTBdIGRybS9h
bWQvZGlzcGxheTogQ2xlYXIgRFBDRCBsYW5lIHNldHRpbmdzIGFmdGVyIHJlcGVhdGVyIHRyYWlu
aW5nCmdpdCBiaXNlY3QgZ29vZCBhYmEzYzNmZWRlNTRlNTU1NzM5NTRmYTdhN2UyOGVjMzA0NTU3
ZTUwCiMgYmFkOiBbYTg5NmY4NzBmOGE1ZjIzZWM5NjFkMTZiYWZmZDNmZGExZjhiZTU3Y10gZHJt
L2FtZC9kaXNwbGF5OiBGaXggZm9yIG90ZyBzeW5jaHJvbml6YXRpb24gbG9naWMKZ2l0IGJpc2Vj
dCBiYWQgYTg5NmY4NzBmOGE1ZjIzZWM5NjFkMTZiYWZmZDNmZGExZjhiZTU3YwojIGZpcnN0IGJh
ZCBjb21taXQ6IFthODk2Zjg3MGY4YTVmMjNlYzk2MWQxNmJhZmZkM2ZkYTFmOGJlNTdjXSBkcm0v
YW1kL2Rpc3BsYXk6IEZpeCBmb3Igb3RnIHN5bmNocm9uaXphdGlvbiBsb2dpYwo=
--00000000000021eae505d5456e24--

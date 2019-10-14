Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0222D6BC0
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 00:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5046E5BE;
	Mon, 14 Oct 2019 22:43:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC18189D02
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 22:22:21 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w3so3945213pgt.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 15:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=iNkEDH3ViExpb/y5HnKz3o/CDE3c8oQsLUlWmGCk2mA=;
 b=ZkYjep0knS0o9eiQ4iCU719FdEP2z+nUCfatnsBBJxHYMCFhqn4pK1fNTaFmG3U95v
 8wZFU+TFL/VE9/vuCPQLi07KUAMpqbMbrQ5cvOVTGE6HgNZhFx9DyJS4bh04ntCXP7aF
 QC458qSEQZVJyo2ZnSeqH48y457vko3OUUBYL3vmjsgdlMSLe04F3/c6gbsrZP/XIGR2
 leWhdavcC3prbjf6+8jViqeh6hyEoyrpRm2mAqfAvTLxIJMMnpXh8pmwBkE4ZiJDZlRJ
 8+Q5ZnX4xm4A/FLJCPJxl9Gu4OdB+qYV6qXPIceqWhFNsTZotyanutBptIJav4cuTKD9
 YrgQ==
X-Gm-Message-State: APjAAAXcIG7xFOce3GlxvOlATCDlZbjP468PFyJk8wp4+aNerq3aJhx1
 iFYwkOulB3vq6Iv04h2DlpIxVPP6UWR0NTJPntjc9g==
X-Google-Smtp-Source: APXvYqyurIJ6E+QxMgFHbL4rfPZ1AU4lFd/bZMy6hC8w1IIoa031nWIwxtdnOnNxHXJ9H/rpV+E6U6q9ZR4mOXuO8As=
X-Received: by 2002:a63:5448:: with SMTP id e8mr7961310pgm.10.1571091740976;
 Mon, 14 Oct 2019 15:22:20 -0700 (PDT)
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 14 Oct 2019 15:22:09 -0700
Message-ID: <CAKwvOdnDVe-dahZGnRtzMrx-AH_C+2Lf20qjFQHNtn9xh=Okzw@mail.gmail.com>
Subject: AMDGPU and 16B stack alignment
To: Harry Wentland <harry.wentland@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>
X-Mailman-Approved-At: Mon, 14 Oct 2019 22:43:37 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=iNkEDH3ViExpb/y5HnKz3o/CDE3c8oQsLUlWmGCk2mA=;
 b=Y7lIqjntH5QlaeThyf1TiQlgL4k3YYX6zT4Rp28vGgY/nou3sE+AbBJONe/Qj9YmuU
 66QHF8+NmolZkNWV5gcyXImhJrxu2FaFqgXexfaW+t9B6+j/AsTzVXb0LZOFsKU/+kH6
 1m5ue/Hfh+crxXF2Wu/f+hID38C5u4poBphX0lR5tyh6kTPJwfnQEBROi53IEP7UDZVC
 V1i/mceVKN1jgjF8Af4KwksD3lOPBdGXg6vSB48kFS3mLEUsRitYWPA6IQHCDMBtOOez
 vu1OK/S8RfBJwgZAoJMQNv+hPTJtddvnWcIY/7UnrmVEEBdAeiG7UEfjyGYAePfCIkr2
 auzw==
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 Arnd Bergmann <arnd@arndb.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 andrew.cooper3@citrix.com, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "S, Shirish" <shirish.s@amd.com>,
 Matthias Kaehlcke <mka@google.com>, yshuiv7@gmail.com, "Koenig,
 Christian" <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGVsbG8hCgpUaGUgeDg2IGtlcm5lbCBpcyBjb21waWxlZCB3aXRoIGFuIDhCIHN0YWNrIGFsaWdu
bWVudCB2aWEKICAgIGAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT0zYCBmb3IgR0NDIHNpbmNl
IDMuNi1yYzEgdmlhCiAgICBjb21taXQgZDliMGNkZTkxYzYwICgieDg2LTY0LCBnY2M6IFVzZQot
bXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT0zIGlmIHN1cHBvcnRlZCIpCiAgICBvciBgLW1zdGFj
ay1hbGlnbm1lbnQ9OGAgZm9yIENsYW5nLiBQYXJ0cyBvZiB0aGUgQU1ER1BVIGRyaXZlciBhcmUK
ICAgIGNvbXBpbGVkIHdpdGggMTZCIHN0YWNrIGFsaWdubWVudC4KCiAgICBHZW5lcmFsbHksIHRo
ZSBzdGFjayBhbGlnbm1lbnQgaXMgcGFydCBvZiB0aGUgQUJJLiBMaW5raW5nIHRvZ2V0aGVyIHR3
bwogICAgZGlmZmVyZW50IHRyYW5zbGF0aW9uIHVuaXRzIHdpdGggZGlmZmVyaW5nIHN0YWNrIGFs
aWdubWVudCBpcyBkYW5nZXJvdXMsCiAgICBwYXJ0aWN1bGFybHkgd2hlbiB0aGUgdHJhbnNsYXRp
b24gdW5pdCB3aXRoIHRoZSBzbWFsbGVyIHN0YWNrIGFsaWdubWVudAogICAgbWFrZXMgY2FsbHMg
aW50byB0aGUgdHJhbnNsYXRpb24gdW5pdCB3aXRoIHRoZSBsYXJnZXIgc3RhY2sgYWxpZ25tZW50
LgogICAgV2hpbGUgOEIgYWxpZ25lZCBzdGFja3MgYXJlIHNvbWV0aW1lcyBhbHNvIDE2QiBhbGln
bmVkLCB0aGV5IGFyZSBub3QKICAgIGFsd2F5cy4KCiAgICBNdWx0aXBsZSB1c2VycyBoYXZlIHJl
cG9ydGVkIEdlbmVyYWwgUHJvdGVjdGlvbiBGYXVsdHMgKEdQRikgd2hlbiB1c2luZwogICAgdGhl
IEFNREdQVSBkcml2ZXIgY29tcGlsZWQgd2l0aCBDbGFuZy4gQ2xhbmcgaXMgcGxhY2luZyBvYmpl
Y3RzIGluIHN0YWNrCiAgICBzbG90cyBhc3N1bWluZyB0aGUgc3RhY2sgaXMgMTZCIGFsaWduZWQs
IGFuZCBzZWxlY3RpbmcgaW5zdHJ1Y3Rpb25zIHRoYXQKICAgIHJlcXVpcmUgMTZCIGFsaWduZWQg
bWVtb3J5IG9wZXJhbmRzLiBBdCBydW50aW1lLCBzeXNjYWxscyBoYW5kbGluZyA4QgogICAgc3Rh
Y2sgYWxpZ25lZCBjb2RlIGNhbGxzIGludG8gY29kZSB0aGF0IGFzc3VtZXMgMTZCIHN0YWNrIGFs
aWdubWVudC4KICAgIFdoZW4gdGhlIHN0YWNrIGlzIGEgbXVsdGlwbGUgb2YgOEIgYnV0IG5vdCAx
NkIsIHRoZXNlIGluc3RydWN0aW9ucwogICAgcmVzdWx0IGluIGEgR1BGLgoKICAgIEdDQyBkb2Vz
bid0IHNlbGVjdCBpbnN0cnVjdGlvbnMgd2l0aCBhbGlnbm1lbnQgcmVxdWlyZW1lbnRzLCBzbyB0
aGUgR1BGcwogICAgYXJlbid0IG9ic2VydmVkLCBidXQgaXQgaXMgc3RpbGwgY29uc2lkZXJlZCBh
biBBQkkgYnJlYWthZ2UgdG8gbWl4IGFuZAogICAgbWF0Y2ggc3RhY2sgYWxpZ25tZW50LgoKSSBo
YXZlIHBhdGNoZXMgdGhhdCBiYXNpY2FsbHkgcmVtb3ZlIC1tcHJlZmVycmVkLXN0YWNrLWJvdW5k
YXJ5PTQgYW5kCi1tc3RhY2stYWxpZ25tZW50PTE2IGZyb20gQU1ER1BVOgpodHRwczovL2dpdGh1
Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy83MzUjaXNzdWVjb21tZW50LTU0MTI0
NzYwMQpZdXh1YW4gaGFzIHRlc3RlZCB3aXRoIENsYW5nIGFuZCBHQ0MgYW5kIHJlcG9ydGVkIGl0
IGZpeGVzIHRoZSBHUEYncyBvYnNlcnZlZC4KCkkndmUgc3BsaXQgdGhlIHBhdGNoIGludG8gNDsg
c2FtZSBjb21taXQgbWVzc2FnZSBidXQgZGlmZmVyZW50IEZpeGVzCnRhZ3Mgc28gdGhhdCB0aGV5
IGJhY2twb3J0IHRvIHN0YWJsZSBvbiBmaW5lciBncmFudWxhcml0eS4gMiBxdWVzdGlvbnMKQkVG
T1JFIEkgc2VuZCB0aGUgc2VyaWVzOgoKMS4gV291bGQgeW91IHByZWZlciA0IHBhdGNoZXMgd2l0
aCB1bmlxdWUgYGZpeGVzYCB0YWdzLCBvciAxIHBhdGNoPwoyLiBXYXMgdGhlcmUgb3IgaXMgdGhl
cmUgc3RpbGwgYSBnb29kIHJlYXNvbiBmb3IgdGhlIHN0YWNrIGFsaWdubWVudCBtaXNtYXRjaD8K
CihGdXJ0aGVyLCBJIHRoaW5rIHdlIGNhbiB1c2UgLW1zc2UyIGZvciBCT1RIIGNsYW5nK2djYyBh
ZnRlciBteSBwYXRjaCwKYnV0IEkgZG9uJ3QgaGF2ZSBoYXJkd2FyZSB0byB0ZXN0IG9uLiBJJ20g
aGFwcHkgdG8gd3JpdGUvc2VuZCB0aGUKZm9sbG93IHVwIHBhdGNoLCBidXQgSSdkIG5lZWQgaGVs
cCB0ZXN0aW5nKS4KLS0gClRoYW5rcywKfk5pY2sgRGVzYXVsbmllcnMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

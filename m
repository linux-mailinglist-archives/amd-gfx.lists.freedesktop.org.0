Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E09E026E
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 13:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF526E5CE;
	Tue, 22 Oct 2019 11:01:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC6C6E5CE
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 11:01:03 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r1so7738958wrs.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 04:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vF43ToBS4ACX01rDYEwjwKebeZsuU5LsLy18DQKop+I=;
 b=mWUNVFs1lecqgjaJjKxAtZSMbYK16PdcGmSXbAsHSlFXx1FpVXWBzBayDZiDgCo5UI
 YRSm01DW1ijz0Mfpi8Z44Y6fUc1MfWin4HYgRnN0I9E4WGkpEGNoi3rHYrjktoPk/PQv
 wmy4YL/R7LoWl7HrjFpuzaZ7/jLSN10awRWjb7g9ZRZIM5Sn5oZ0tdMuDZNLUNeVDkgX
 Uj8G1HJfd3+XcAbSqFwilifXPQ77HVQOr9Qe6hPvm/IhUdVYHOQVPS1fSHNLHj04Q1tA
 jwb7uPeuYB7vzIvoagLpuewGJrxBsQCGUQAHJvKi3rowYPNyEAAmQJF/Ed7a0BQ8emKk
 +01A==
X-Gm-Message-State: APjAAAV8DnSj1K5wyoA9Yec7FsMcvuLc/c3lJMrxwHUbZE89JQIi5tv7
 F/2QXWpjsYLVG7abv9gWI1wzYNOswrvcX8OAwV3G4RQG
X-Google-Smtp-Source: APXvYqzJvOhbUEm7nomnfVVfw3x9zGnSoTGURYYtNz1vKk87JRo0vAgnRyOZQyn4ee9TeSon/KVjBzgj7oCeuqtToA0=
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr2840571wro.234.1571742062175; 
 Tue, 22 Oct 2019 04:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAHL+j0_2ir=8hHDoyqizweOUSV6XfqC-UCD15WuJ9vvptNLr0g@mail.gmail.com>
 <CADnq5_N0r8O2vQapGaary0L-OfdTdz-ezcMJK90+Gy2sPujYcw@mail.gmail.com>
 <CAHL+j08qsu1pSOZPLB9-XWw9ZmT2OamaWPBJV4T3Vzx_C8cD7g@mail.gmail.com>
 <67658520-b3f4-d2f9-7247-dd434ab5c30b@amd.com>
 <CAHL+j0-Nm+6VFXi_w4iciNdG40zubpqvh1RXs3MFfXJK2mFr0Q@mail.gmail.com>
 <CAHL+j0_=r1XBOzwiQmbZTVoRsZ5=Du3pAPd_n7pia81FegdHhw@mail.gmail.com>
 <57826a9e-5842-4ddd-a456-67d1d1b9a9ce@amd.com>
 <CAHL+j0-NJ8F4RpMJ5m9_9gk_t+zhwFwVmG6MMy4TBYa4XjnWEA@mail.gmail.com>
 <CADnq5_MTYe5z0gbtY0eCnUax2D=HZYBQF7YWPS86pikDXGVWOA@mail.gmail.com>
 <CAHL+j0_Dn9VZ7CN-yaaFP4kk39gWTKu4fLZ6SN4Dj17e2z+4RQ@mail.gmail.com>
 <CAHL+j08BgqmOoQHnsfE3xtZFsz14cOZ=Xui3o7mENJd3Fq0z0g@mail.gmail.com>
 <CAHL+j0-E83G4+xYDcJ2xB2abF9DXA78CXfP9LrVVktTmvsBYvg@mail.gmail.com>
In-Reply-To: <CAHL+j0-E83G4+xYDcJ2xB2abF9DXA78CXfP9LrVVktTmvsBYvg@mail.gmail.com>
From: Sylvain Munaut <246tnt@gmail.com>
Date: Tue, 22 Oct 2019 13:01:22 +0200
Message-ID: <CAHL+j0-D=AX7==2RRTXDaKEQwid8x817XO-upaDmCemMpvEF6Q@mail.gmail.com>
Subject: Re: Spontaneous reboots when using RX 560
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=vF43ToBS4ACX01rDYEwjwKebeZsuU5LsLy18DQKop+I=;
 b=uAlqAJ/tXKI6z1cchOGT/DDHJWdS35HNqe8Lj9lxX0qCI/2YgpwU/kov+KQGK+8POS
 kPmeAUVI6Ng9ldH2yqxNJ7QmSOAEfDukDEkHbJ/F94xBcx5XtaZAiT7K9t6PqBtw0szm
 5wF/1V3QEWEY5Us1g7biYiNJx/aWzAGFxChuMjkN1LbA6rI30sZrx4plJhlCZsKSbGmF
 qDQ5XSxlINZR/7fwBr9Iz6t9JYLvqJ0Y9slVr6CoGGeXFD+35nlfITUivTwwEX5ajnA0
 TO39gvmOpzZ2FJV5owt0CVLIG8ALPVkSXdSc7/4X9I2ytIlU1Iz0N1/W7VhMTvPkQSG7
 WXRg==
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQWxsLAoKTW9yZSB0ZXN0aW5nIG92ZXIgdGhlIGxhc3QgZmV3IGRheXMgc2hvd2VkIHRoYXQg
b25seSBlaXRoZXIgdGhlIGxvd2VzdApwb3dlciBtb2RlLCBvciBzbGlnaHRseSBhYm92ZSBjYW4g
d29yay4gT2gsIEkgYWxzbyB0ZXN0ZWQgNS40LXJjMyBqdXN0CmluIGNhc2UgYnV0IHNhbWUgcmVz
dWx0cy4KSXQgZG9lc24ndCBzZWVtIHRvIGJlIHRoZSBhZmZlY3RlZCBieSBQQ0llIGxhbmUgc3Bl
ZWQsIE1lbW9yeSBzZWVtcwpzdGFibGUgYXQgNjI1TSBhbmQgYWxtb3N0IGF0IDE1MDBNIChvbmx5
IHRoZSBzdXN0YWluZWQgaGVhdnkgd29ya2xvYWQKZXZlbnR1YWxseSBicmluZyBpdCBkb3duKSwg
YnV0IHRoZSBTb0Mgc3BlZWQgc2VlbXMgcHJldHR5IHRvdWNoeS4KClNvIHRoYXQgd291bGQgc2Vl
bSB0byBjb25maXJtIHNvbWV0aGluZyBpcyB3cm9uZyBlaXRoZXIgaW4gdGhlIHBvd2VyCnBsYXkg
dGFibGUgaXRzZWxmLCBvciBpdHMgaW50ZXJwcmV0YXRpb24gYnkgdGhlIGxpbnV4IGRyaXZlci4K
SSB0cmllZCBicnV0ZS1sb2FkaW5nIHNvbWUgb3RoZXIgUlg1NzAgcHB0YWJsZSBpbnRvIGl0LCBi
dXQgdGhhdApkaWRuJ3QgcmVhbGx5IGRvIG11Y2guIEFmdGVyIHdyaXRpbmcgaXQgdG8gcHBfdGFi
bGUsIHRoZSBjYXJkIHdhcwpzdHVjayBhdCBpdHMgbG93ZXIgY2xvY2sgbW9kZS4gV29ya2luZyBm
aW5lLCBidXQgc2FtZSBhcyBpZiBJIGhhZApmb3JjZWQgaXQgdG8gbG93IHBvd2VyLgoKSXMgdGhl
cmUgYW55d2F5IHRvIGV4dHJhY3QgdGhlIHBvd2VyIHBsYXkgdGFibGUgZnJvbSB3aW5kb3dzIHNp
bmNlCml0J3MgcnVubmluZyBmaW5lIHRoZXJlID8KSSdtIGtpbmQgb2YgcnVubmluZyBvdXQgb2Yg
aWRlYSBvZiB3aGF0IHRvIHRyeSBuZXh0LgoKQ2hlZXJzLAoKICAgIFN5bHZhaW4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C087B36A
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 21:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8336E604;
	Tue, 30 Jul 2019 19:34:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8386E604
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 19:34:13 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id q22so11081954iog.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 12:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=KK3vtLG6lKSu0vqvnSuDCtOxJYRF2V8JCzU1FjuOrfc=;
 b=r7eN6APFAbanwluTrW/64/Gm/JhKQr2QMVWpdOQ/CtoXt00Bqwv/wSYPqIoG+avhI+
 PdE+OrLqGm7EcpwrXlKJ3dw4sBFHdOT8nfdgVC1mYe7XCOt4PfXS+BvEEfWjWsnfAa1R
 YSZM4I+rOSoJG1bO8Wyj/CD6NCDLmu1jUdx6x8q9KHEyqrJ8ps42JdBDyyfemFo5V8iJ
 Y+pisuB++UoJg7wvslddcvz1s3BfHq4ZdqJI+z0dx/iQ3SajqzdwMOLF4eQCaj5tzH3g
 Ln5aVq04pXrgCQGw01XD7HYMHQRousQBb0/JhC8XDMInU7HgP7ZSjzmNxWSvJxEfcrBN
 kjhg==
X-Gm-Message-State: APjAAAWLG35uaAsnxN0KOXNOTp//qmO8ukVpouR8h7DGgnU4NNJyudl1
 7hCD61LtbySVOYJtxAoX+n34+DfQnLMrvhmQo5GhxGG8CyTNCA==
X-Google-Smtp-Source: APXvYqyH9IWgA6z3NW5xoB8YanJEASVoM7lKXImaLGJ29vCUkAwqLYuG1f8JhjYyA3ka9wfpcxW40XVe+0vry6+aAtY=
X-Received: by 2002:a5d:948f:: with SMTP id v15mr90646020ioj.93.1564515252106; 
 Tue, 30 Jul 2019 12:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsOwOOw=i5Mvn33pTU6N-WgF3NY=QNWmXZnTg-2yzJY9+g@mail.gmail.com>
 <CABXGCsO_tZ+35a-21ao9P0pMECMBZ5MZJcNwViRWNEfxHt=WUQ@mail.gmail.com>
In-Reply-To: <CABXGCsO_tZ+35a-21ao9P0pMECMBZ5MZJcNwViRWNEfxHt=WUQ@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 31 Jul 2019 00:34:01 +0500
Message-ID: <CABXGCsMoHdv2sJPuVsb6yj-sD6P4zQesMQn7qASMczOuSmkJjg@mail.gmail.com>
Subject: Re: between commits d7d170a8e357 and 22051d9c4a57 begins issue page
 allocation failure in gnome-shell process
To: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Harry Wentland <harry.wentland@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=KK3vtLG6lKSu0vqvnSuDCtOxJYRF2V8JCzU1FjuOrfc=;
 b=PpfTb4gO5JKg+bH/e+uOweEM++/3Lz/BuoDUvw/KmTrbohrAoDGYW1XOvn1R4G0D4W
 VJcAELqrK8WSSfpHozprMMn1JH6+6Uh3Biuome60ObCcEhARZ4UJajWKkZIXvNenvVOL
 eD1MhPCQIwoaMl9RLXiQD91ZDvPBGSnp2i81CXmEdnk9drxaQbq2zJRvBoutrbNrUq0e
 hC49tNr8VV2uyRAYMzfLSs1pjkMKUJ54kmlyUhk4gyaxFpZ6yjl+0j/eGemBssoAk3X0
 Kaj+hPqVnbcToPmv6OABxITTeXUkkfF/AoEfBLz7e+KvCZcNqj+Avy2F4qTBtzAh9FFm
 mFZA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXMgYW55b25lIGhlcmU/IElzIGV2ZXJ5b25lIHNvIGJ1c3kgd2hhdCBpcyB3cm9uZz8KUkMyIGlz
IHN0aWxsIGFmZmVjdGVkIGJ5IHRoaXMgaXNzdWUgYW5kIHVudXNhYmxlIGZvciBldmVyeSBkYXkg
YmVjYXVzZQpvcGVuaW5nIGEgdmlkZW8gaW4gdG90ZW0gcGxheWVyIGNhdXNlIERFIGEgaGFuZyB3
aXRoIGEgbG90IG9mCm1lc3NhZ2VzOgoKWyAxMDcyLjI4MzUxOF0gYW1kZ3B1IDAwMDA6MGI6MDAu
MDogW2dmeGh1Yl0gcmV0cnkgcGFnZSBmYXVsdAooc3JjX2lkOjAgcmluZzowIHZtaWQ6MyBwYXNp
ZDozMjc2OSwgZm9yIHByb2Nlc3MgZ25vbWUtc2hlbGwgcGlkIDE5NDgKdGhyZWFkIGdub21lLXNo
ZWw6Y3MwIHBpZCAxOTgzKQpbIDEwNzIuMjgzNTMwXSBhbWRncHUgMDAwMDowYjowMC4wOiAgIGlu
IHBhZ2Ugc3RhcnRpbmcgYXQgYWRkcmVzcwoweDAwMDAwMDAxYzMzODUwMDAgZnJvbSAyNwpbIDEw
NzIuMjgzNTMzXSBhbWRncHUgMDAwMDowYjowMC4wOiBWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX1NU
QVRVUzoweDAwMzAxMDMxClsgMTA3Mi4yODM1MzldIGFtZGdwdSAwMDAwOjBiOjAwLjA6IFtnZnho
dWJdIHJldHJ5IHBhZ2UgZmF1bHQKKHNyY19pZDowIHJpbmc6MCB2bWlkOjMgcGFzaWQ6MzI3Njks
IGZvciBwcm9jZXNzIGdub21lLXNoZWxsIHBpZCAxOTQ4CnRocmVhZCBnbm9tZS1zaGVsOmNzMCBw
aWQgMTk4MykKWyAxMDcyLjI4MzU0MV0gYW1kZ3B1IDAwMDA6MGI6MDAuMDogICBpbiBwYWdlIHN0
YXJ0aW5nIGF0IGFkZHJlc3MKMHgwMDAwMDAwMWMzMzg5MDAwIGZyb20gMjcKWyAxMDcyLjI4MzU0
M10gYW1kZ3B1IDAwMDA6MGI6MDAuMDogVk1fTDJfUFJPVEVDVElPTl9GQVVMVF9TVEFUVVM6MHgw
MDMwMTAzMQpbIDEwNzIuMjgzNTQ4XSBhbWRncHUgMDAwMDowYjowMC4wOiBbZ2Z4aHViXSByZXRy
eSBwYWdlIGZhdWx0CihzcmNfaWQ6MCByaW5nOjAgdm1pZDozIHBhc2lkOjMyNzY5LCBmb3IgcHJv
Y2VzcyBnbm9tZS1zaGVsbCBwaWQgMTk0OAp0aHJlYWQgZ25vbWUtc2hlbDpjczAgcGlkIDE5ODMp
ClsgMTA3Mi4yODM1NTFdIGFtZGdwdSAwMDAwOjBiOjAwLjA6ICAgaW4gcGFnZSBzdGFydGluZyBh
dCBhZGRyZXNzCjB4MDAwMDAwMDFjMzM4NzAwMCBmcm9tIDI3ClsgMTA3Mi4yODM1NTJdIGFtZGdw
dSAwMDAwOjBiOjAwLjA6IFZNX0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTOjB4MDAzMDEwMzEK
WyAxMDcyLjI4MzU1N10gYW1kZ3B1IDAwMDA6MGI6MDAuMDogW2dmeGh1Yl0gcmV0cnkgcGFnZSBm
YXVsdAooc3JjX2lkOjAgcmluZzowIHZtaWQ6MyBwYXNpZDozMjc2OSwgZm9yIHByb2Nlc3MgZ25v
bWUtc2hlbGwgcGlkIDE5NDgKdGhyZWFkIGdub21lLXNoZWw6Y3MwIHBpZCAxOTgzKQpbIDEwNzIu
MjgzNTU5XSBhbWRncHUgMDAwMDowYjowMC4wOiAgIGluIHBhZ2Ugc3RhcnRpbmcgYXQgYWRkcmVz
cwoweDAwMDAwMDAxYzMzODgwMDAgZnJvbSAyNwpbIDEwNzIuMjgzNTYwXSBhbWRncHUgMDAwMDow
YjowMC4wOiBWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX1NUQVRVUzoweDAwMzAxMDMxClsgMTA3Mi4y
ODM1NjVdIGFtZGdwdSAwMDAwOjBiOjAwLjA6IFtnZnhodWJdIHJldHJ5IHBhZ2UgZmF1bHQKKHNy
Y19pZDowIHJpbmc6MCB2bWlkOjMgcGFzaWQ6MzI3NjksIGZvciBwcm9jZXNzIGdub21lLXNoZWxs
IHBpZCAxOTQ4CnRocmVhZCBnbm9tZS1zaGVsOmNzMCBwaWQgMTk4MykKWyAxMDcyLjI4MzU2Nl0g
YW1kZ3B1IDAwMDA6MGI6MDAuMDogICBpbiBwYWdlIHN0YXJ0aW5nIGF0IGFkZHJlc3MKMHgwMDAw
MDAwMWMzMzhjMDAwIGZyb20gMjcKWyAxMDcyLjI4MzU2OF0gYW1kZ3B1IDAwMDA6MGI6MDAuMDog
Vk1fTDJfUFJPVEVDVElPTl9GQVVMVF9TVEFUVVM6MHgwMDMwMTAzMQoKQWxsIFZlZ2EgR1BVIGlz
IGFmZmVjdGVkOiBWZWdhIDU2LCBWZWdhIDY0LCBSYWRlb24gVklJCgotLQpCZXN0IFJlZ2FyZHMs
Ck1pa2UgR2F2cmlsb3YuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

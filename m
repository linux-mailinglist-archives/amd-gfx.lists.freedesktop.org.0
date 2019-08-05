Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3C080FEA
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 03:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D77589DD3;
	Mon,  5 Aug 2019 01:07:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E5B89DD3
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 01:07:09 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id s19so56605511lfb.9
 for <amd-gfx@lists.freedesktop.org>; Sun, 04 Aug 2019 18:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vjPRGNsPgPJMOOy139Tk1epMdOEGZs/aZE9OphbkFTQ=;
 b=j999g5pRhvmi9YVPPbJ8MYKCTFrUjZLZd3MeTQrRi7rPQWxpPSojNU6Kuk7pflBVUa
 1Ln900HbKDYqmX37u7dZ58acwqptYOwFsunaraAgme4hTtSZAXlHJEXJkb74HxvFRlt3
 JhCB+bR0bT5Kf5yPJow7o+3X+CPFELkdRmUtLRLaJ/X3gO5MY7eQaXXAeNCgncva/xrD
 eRwGFe0jjZr2IKTieftObPX6ai3uGJD0IVxNb/4dFUl3gaN42sZSjpOpQwLQFEgmT6rv
 DIn0OQp9fRTeFoksToRsVA9ERJWg5AhAxim0sMqM8bacZ0bsbWc+S288KIDyUCbhF5eO
 xkHA==
X-Gm-Message-State: APjAAAWGxUeaGEK1gcpFbVa4ZX1r6poZG9ALYOOtrEb+6F2hoIaT7va8
 9mm5qB10B2FckvzNCoLcSZewJ6cJ1SMloY2Jprg=
X-Google-Smtp-Source: APXvYqxazEby1HZF4fP12HoQbgiCVdeNopoq+DRQljkKH2maO3ahQQsyMeqMUPTnFbizXu5+x8HDd7OdzEcWTeyquec=
X-Received: by 2002:a19:ccc6:: with SMTP id
 c189mr68906863lfg.160.1564967227745; 
 Sun, 04 Aug 2019 18:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsOwOOw=i5Mvn33pTU6N-WgF3NY=QNWmXZnTg-2yzJY9+g@mail.gmail.com>
 <CABXGCsO_tZ+35a-21ao9P0pMECMBZ5MZJcNwViRWNEfxHt=WUQ@mail.gmail.com>
 <CABXGCsMoHdv2sJPuVsb6yj-sD6P4zQesMQn7qASMczOuSmkJjg@mail.gmail.com>
In-Reply-To: <CABXGCsMoHdv2sJPuVsb6yj-sD6P4zQesMQn7qASMczOuSmkJjg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 5 Aug 2019 11:06:56 +1000
Message-ID: <CAPM=9tzUE609zp5dWz1sp7S3gLvcDhswifOtn8O3f-TsD3E3VQ@mail.gmail.com>
Subject: Re: between commits d7d170a8e357 and 22051d9c4a57 begins issue page
 allocation failure in gnome-shell process
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=vjPRGNsPgPJMOOy139Tk1epMdOEGZs/aZE9OphbkFTQ=;
 b=MfM4zCO9EwM9ZahzJIj4I46dNTNO+ZkrXBrDEbX1HLhicvSQXl/YvdoPGq2Pcyj5Ih
 wKaEWfeRQ4CpjCAAYrJM+zAvXSA8YV703+nJuQdsJ5SDwh/dZA2Eo/wq4y3y/SusF0yS
 KkhX834jpWS45eqhhmeZ4DO0svk39GPvCqoIF6moKYmwbsnv6dAjXqFGaUQePL/wjboE
 pXTVM6ehKylUjy/72XZ0V50MbzyAziCcsoYNp1AhCrxCABKOc4bYZKY3IEkpYwxehJfE
 p8H5cAfbHk/7EEh0Z69Y/F6zZ+9vp/7bUeqaOnAXIxtZhZwsoHwyi+7TuPmSayvDuF8+
 hk/g==
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCAzMSBKdWwgMjAxOSBhdCAwNTozNCwgTWlraGFpbCBHYXZyaWxvdgo8bWlraGFpbC52
LmdhdnJpbG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBJcyBhbnlvbmUgaGVyZT8gSXMgZXZlcnlv
bmUgc28gYnVzeSB3aGF0IGlzIHdyb25nPwo+IFJDMiBpcyBzdGlsbCBhZmZlY3RlZCBieSB0aGlz
IGlzc3VlIGFuZCB1bnVzYWJsZSBmb3IgZXZlcnkgZGF5IGJlY2F1c2UKPiBvcGVuaW5nIGEgdmlk
ZW8gaW4gdG90ZW0gcGxheWVyIGNhdXNlIERFIGEgaGFuZyB3aXRoIGEgbG90IG9mCj4gbWVzc2Fn
ZXM6Cj4KClRoaXMgbG9va3MgbGlrZSBkY19zdGF0ZSBnb3QgYSBzaXplIGluY3JlYXNlLCBIYXJy
eSBsb29rcyBsaWtlIHlvdXIgYXJlYS4KCkxldCdzIG1ha2UgZGNfc3RhdGUgbm90IGJlIHNvIGxh
cmdlLiBhIDQgb3JkZXIgYWxsb2NhdGlvbiBpc24ndAp0cml2aWFsIGZvciBhbiBvYmplY3QgdGhh
dCB3ZSBjb25zdGFudGx5IGFsbG9jL2Rlc3Ryb3kuCgpEYXZlLgo+IFsgMTA3Mi4yODM1MThdIGFt
ZGdwdSAwMDAwOjBiOjAwLjA6IFtnZnhodWJdIHJldHJ5IHBhZ2UgZmF1bHQKPiAoc3JjX2lkOjAg
cmluZzowIHZtaWQ6MyBwYXNpZDozMjc2OSwgZm9yIHByb2Nlc3MgZ25vbWUtc2hlbGwgcGlkIDE5
NDgKPiB0aHJlYWQgZ25vbWUtc2hlbDpjczAgcGlkIDE5ODMpCj4gWyAxMDcyLjI4MzUzMF0gYW1k
Z3B1IDAwMDA6MGI6MDAuMDogICBpbiBwYWdlIHN0YXJ0aW5nIGF0IGFkZHJlc3MKPiAweDAwMDAw
MDAxYzMzODUwMDAgZnJvbSAyNwo+IFsgMTA3Mi4yODM1MzNdIGFtZGdwdSAwMDAwOjBiOjAwLjA6
IFZNX0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTOjB4MDAzMDEwMzEKPiBbIDEwNzIuMjgzNTM5
XSBhbWRncHUgMDAwMDowYjowMC4wOiBbZ2Z4aHViXSByZXRyeSBwYWdlIGZhdWx0Cj4gKHNyY19p
ZDowIHJpbmc6MCB2bWlkOjMgcGFzaWQ6MzI3NjksIGZvciBwcm9jZXNzIGdub21lLXNoZWxsIHBp
ZCAxOTQ4Cj4gdGhyZWFkIGdub21lLXNoZWw6Y3MwIHBpZCAxOTgzKQo+IFsgMTA3Mi4yODM1NDFd
IGFtZGdwdSAwMDAwOjBiOjAwLjA6ICAgaW4gcGFnZSBzdGFydGluZyBhdCBhZGRyZXNzCj4gMHgw
MDAwMDAwMWMzMzg5MDAwIGZyb20gMjcKPiBbIDEwNzIuMjgzNTQzXSBhbWRncHUgMDAwMDowYjow
MC4wOiBWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX1NUQVRVUzoweDAwMzAxMDMxCj4gWyAxMDcyLjI4
MzU0OF0gYW1kZ3B1IDAwMDA6MGI6MDAuMDogW2dmeGh1Yl0gcmV0cnkgcGFnZSBmYXVsdAo+IChz
cmNfaWQ6MCByaW5nOjAgdm1pZDozIHBhc2lkOjMyNzY5LCBmb3IgcHJvY2VzcyBnbm9tZS1zaGVs
bCBwaWQgMTk0OAo+IHRocmVhZCBnbm9tZS1zaGVsOmNzMCBwaWQgMTk4MykKPiBbIDEwNzIuMjgz
NTUxXSBhbWRncHUgMDAwMDowYjowMC4wOiAgIGluIHBhZ2Ugc3RhcnRpbmcgYXQgYWRkcmVzcwo+
IDB4MDAwMDAwMDFjMzM4NzAwMCBmcm9tIDI3Cj4gWyAxMDcyLjI4MzU1Ml0gYW1kZ3B1IDAwMDA6
MGI6MDAuMDogVk1fTDJfUFJPVEVDVElPTl9GQVVMVF9TVEFUVVM6MHgwMDMwMTAzMQo+IFsgMTA3
Mi4yODM1NTddIGFtZGdwdSAwMDAwOjBiOjAwLjA6IFtnZnhodWJdIHJldHJ5IHBhZ2UgZmF1bHQK
PiAoc3JjX2lkOjAgcmluZzowIHZtaWQ6MyBwYXNpZDozMjc2OSwgZm9yIHByb2Nlc3MgZ25vbWUt
c2hlbGwgcGlkIDE5NDgKPiB0aHJlYWQgZ25vbWUtc2hlbDpjczAgcGlkIDE5ODMpCj4gWyAxMDcy
LjI4MzU1OV0gYW1kZ3B1IDAwMDA6MGI6MDAuMDogICBpbiBwYWdlIHN0YXJ0aW5nIGF0IGFkZHJl
c3MKPiAweDAwMDAwMDAxYzMzODgwMDAgZnJvbSAyNwo+IFsgMTA3Mi4yODM1NjBdIGFtZGdwdSAw
MDAwOjBiOjAwLjA6IFZNX0wyX1BST1RFQ1RJT05fRkFVTFRfU1RBVFVTOjB4MDAzMDEwMzEKPiBb
IDEwNzIuMjgzNTY1XSBhbWRncHUgMDAwMDowYjowMC4wOiBbZ2Z4aHViXSByZXRyeSBwYWdlIGZh
dWx0Cj4gKHNyY19pZDowIHJpbmc6MCB2bWlkOjMgcGFzaWQ6MzI3NjksIGZvciBwcm9jZXNzIGdu
b21lLXNoZWxsIHBpZCAxOTQ4Cj4gdGhyZWFkIGdub21lLXNoZWw6Y3MwIHBpZCAxOTgzKQo+IFsg
MTA3Mi4yODM1NjZdIGFtZGdwdSAwMDAwOjBiOjAwLjA6ICAgaW4gcGFnZSBzdGFydGluZyBhdCBh
ZGRyZXNzCj4gMHgwMDAwMDAwMWMzMzhjMDAwIGZyb20gMjcKPiBbIDEwNzIuMjgzNTY4XSBhbWRn
cHUgMDAwMDowYjowMC4wOiBWTV9MMl9QUk9URUNUSU9OX0ZBVUxUX1NUQVRVUzoweDAwMzAxMDMx
Cj4KPiBBbGwgVmVnYSBHUFUgaXMgYWZmZWN0ZWQ6IFZlZ2EgNTYsIFZlZ2EgNjQsIFJhZGVvbiBW
SUkKPgo+IC0tCj4gQmVzdCBSZWdhcmRzLAo+IE1pa2UgR2F2cmlsb3YuCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlz
dAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==

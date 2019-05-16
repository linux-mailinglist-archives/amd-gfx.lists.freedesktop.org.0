Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4B81FCEF
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 03:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7923389247;
	Thu, 16 May 2019 01:43:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8681489247
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 01:43:25 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h4so1449922wre.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 18:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v2jLRUvpZ9mdaWhTACf60QVuTI8qwiP+MbrFS7gDyrs=;
 b=tMlYT3MrflLY+PdAfaJ93eSwW7iE5kb+N+9/SZ5o6XAxp6YvWdBsm5eIoZYjNTyrsI
 lSw8gh/80KWg7g+MkBo0M26rt5KKBrkiQM8dsSfETKI4hmv5/vfr2ypw8ccgZ8cholX0
 AkqPbW2RFe1m/7gSHVqu3rJ1fUG0J4HxoEXwkjrq66i6aam1NFCb0RKEwdGpgOuaLBBt
 v3pVBQdnCJm5rDmHjg3HjnXSiYnTC4VQb2D80xiw4pG4GxFWyu+/ScglEC5TqpJBEZvw
 iYvAnNrCrtUkj6OQ7C6bHV5pKJBhGoMBIoRC0C6rXq9a9qHgZVdifCMBi7ByeBJe9es5
 jegg==
X-Gm-Message-State: APjAAAXNgldhjog+QUU8Po47xHfEs53MjoS/CAb2HUK3t7sZaCnpQocD
 rWjX4dxKNXikzd/Gfp9H/KoYGvWDD67mHWjUHJ0=
X-Google-Smtp-Source: APXvYqwgeq+IDGs67Ps2fxiM827gR+Wr5VqxASRfXfRTUHsFQdBh1NUgw8DIfpzLPsDdMTUCAQ5jLln1PmZ03raIBQ8=
X-Received: by 2002:adf:b641:: with SMTP id i1mr854700wre.288.1557971004056;
 Wed, 15 May 2019 18:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAF73Y=QuYq3ALtP6xiPyqS+jm_TJCQQDyQ+WA5ZJG8EhWSKiTw@mail.gmail.com>
 <CAF73Y=R96zUxCAEKopSvGReqB+sEFWcHhXSKnR98rpetMbKf4Q@mail.gmail.com>
In-Reply-To: <CAF73Y=R96zUxCAEKopSvGReqB+sEFWcHhXSKnR98rpetMbKf4Q@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 May 2019 21:43:12 -0400
Message-ID: <CADnq5_OOEP+YsQx12cOBaM3NdjM=eGAbbbudEusqf5rNRz8C2Q@mail.gmail.com>
Subject: Re: Hard lockups with ROCM
To: Daniel Kasak <d.j.kasak.dk@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v2jLRUvpZ9mdaWhTACf60QVuTI8qwiP+MbrFS7gDyrs=;
 b=qm9WihJSrX3npcubAWE0PXwGRf2bfb+zm8079v2CABkMwbq/JkSftjZyq6h7+EIsGV
 Z3wEijC5fEmZ1R7jHONM64U+TAPygEASib37XWYFSpu5ZL48cErrnSzxw/ctQVXvXAJz
 027O+EcYFgDMhJCflhdMuzD4HsfAj21LdQmx5gyv9oRoP+x9rC7Qimxj4MgDIlkG160A
 bZMLoP2Y/p2pVZpaokVlzW4j7dbcWTLjSqGVPaJ+zm34sa2yiudetggB3H9W1QOcvQt/
 F666b6kgN6/o2JosiPKSKj2/6hZWlluPnCdhTIKa8MtfjtASrrJrWtnT0YnAgiHEWRDb
 E9VQ==
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

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgODozMyBQTSBEYW5pZWwgS2FzYWsgPGQuai5rYXNhay5k
a0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMTE6NDQgQU0g
RGFuaWVsIEthc2FrIDxkLmoua2FzYWsuZGtAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gSGkgYWxs
LiBJIGhhZCB2ZXJzaW9uIDIuMi4wIG9mIHRoZSBST0NNIHN0YWNrIHJ1bm5pbmcgb24gYSA1LjAu
eCBhbmQgNS4xLjAga2VybmVsLiBUaGluZ3Mgd2VyZSBnb2luZyBncmVhdCB3aXRoIHZhcmlvdXMg
Ym9pbmMgR1BVIHRhc2tzLiBCdXQgdGhlcmUgaXMgYSBzZXRpYXRob21lIEdQVSB0YXNrIHdoaWNo
IHJlbGlhYmx5IGdpdmVzIG1lIGEgaGFyZCBsb2NrdXAgd2l0aGluIGFib3V0IDMwIG1pbnV0ZXMg
b2YgcnVubmluZy4gSSBhY3R1YWxseSBoYWQgdG8gZG8gKnR3byogZW1lcmdlbmN5IHJlLWluc3Rh
bGxzIG92ZXIgdGhlIHBhc3Qgd2Vlay4gUGVyaGFwcyBwYXJ0IG9mIHRoaXMgd2FzIG15IGZhdWx0
ICggcnVubmluZyBidHJmcyB3aXRoIGx6byBjb21wcmVzc2lvbiBvbiBteSByb290IHBhcnRpdGlv
biAuLi4gKS4gQnV0IGFic29sdXRlbHkgcGFydCBvZiB0aGlzIHdhcyB0aGUgaGFyZCBsb2NrdXBz
LiBJJ3ZlIHRlc3RlZCBhbGwga2luZHMgb2Ygb3RoZXIgdGhpbmdzICggZWcgcmVidWlsZGluZyBs
b3RzIG9mIHN0dWZmIHVuZGVyIEdlbnRvbyApIC4uLiBJIGRvbid0IGhhdmUgYSBnZW5lcmFsIHN0
YWJpbGl0eSBpc3N1ZSBldmVuIHVuZGVyIGhvdXJzIG9mIGhpZ2ggbG9hZC4gQnV0IGFmdGVyIHJl
c3RhcnRpbmcgYm9pbmMgd2l0aCB0aGF0IHNhbWUgc2V0aWF0aG9tZSB0YXNrIC4uLiA8YmFuZz4h
Cj4+Cj4+IElmIHNvbWVvbmUgd2FudHMgbWUgdG8gc2FjcmlmaWNlIGFub3RoZXIgaW5zdGFsbGF0
aW9uLCB0aGV5IGNhbiBwb2ludCBtZSB0byBpbnN0cnVjdGlvbnMgZm9yIHRyeWluZyB0byBnYXRo
ZXIgbW9yZSBpbmZvcm1hdGlvbi4KPj4KPj4gQW55d2F5IC4uLiBwZXJoYXBzIG1vcmUgd29yayBh
cm91bmQgZGV0ZWN0aW5nIGFuZCByZWNvdmVyaW5nIGZyb20gR1BVIGxvY2t1cHMgaXMgaW4gb3Jk
ZXI/Cj4+Cj4+IERhbgo+Cj4KPiA8c2lnaD4KPgo+IFRoYXQncyB3aGF0IEkgd2FzIGFmcmFpZCBv
ZiA6KAoKTm90IHN1cmUgd2hhdCB5b3Ugd2VyZSBhZnJhaWQgb2YuICBJIGRvbid0IHRoaW5rIGFu
eW9uZSBoYXMgbG9va2VkIGF0CnNldGlhdGhvbWUgb24gUk9DbS4gIEknZCBzdWdnZXN0IGZpbGlu
ZyBhIGJ1ZwooaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZykgYW5kIGF0dGFjaGluZyB5b3Vy
IGRtZXNnIG91dHB1dCBhbmQKeG9yZyBsb2cgKGlmIHVzaW5nIFgpLiAgSWYgdGhlcmUgaXMgYSBH
UFUgcmVzZXQsIG5vdGUgdGhhdCB5b3Ugd2lsbApuZWVkIHRvIHJlc3RhcnQgeW91ciBkZXNrdG9w
IGVudmlyb25tZW50IGJlY2F1c2UgY3VycmVudGx5IG5laXRoZXIKZ2xhbW9yIG9yIGFueSBjb21w
b3NpdG9ycyBzdXBwb3J0IEdMIHJvYnVzdG5lc3MgZXh0ZW5zaW9ucyB0byByZXNldAp0aGVpciBj
b250ZXh0cyBhZnRlciBhIEdQVSByZXNldC4KCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4

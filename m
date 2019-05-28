Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9202CF1E
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 21:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59966E056;
	Tue, 28 May 2019 19:02:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E10C6E055
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 19:02:42 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id n7so8416712uap.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 12:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=+9BnizOCabQkDdyYFoUODFzvXj83s9DouynwLQc1zAo=;
 b=t8Zqj8xe6Or1AKi1fV5QuFAVLjp+xq0/ujzB+sE6vCeqNHtmLwNnFzc88mRZ+eSZ9/
 C53061sHRPQN4LAc8xPT7F7kByksevVvB/+gE0LFyrtMQe/HPvMO7IPChxDM6J+73Ald
 Xrupm+9g6wNFeT8+CuzGQWJwp47SELXBHFBV2xhu8KSQ0wVzzWtP7j1lXR2C+pWhRKIL
 F/+ybOE2duaNeO/NKRDvode7tKN44rsIpOkVv+2Ordh1ON6JJ/8NgH94da3svGTY4HQg
 VwruCebRlRpqJBsEurjOf+7pgT8iHz/wENbetz3PpcpM4pDkLvUKNfVZ8I1F18WIla5d
 cZlQ==
X-Gm-Message-State: APjAAAUpisn1SaiafkzIzYgeEdPDEnAkxj7wdDgIAyP5LLSxAGaF2SaQ
 N/DAZ1H69U+F6dHmfmTHPTA=
X-Google-Smtp-Source: APXvYqzm/Llg3EcAmooSmrW8alU2K3WRudRMe2u8y10GPBYXtzgiDWUSwvNxu2yC3/mHUonjW+RP1w==
X-Received: by 2002:ab0:7346:: with SMTP id k6mr40444068uap.89.1559070161378; 
 Tue, 28 May 2019 12:02:41 -0700 (PDT)
Received: from localhost ([2620:10d:c091:500::3:d74f])
 by smtp.gmail.com with ESMTPSA id 60sm4466721uah.1.2019.05.28.12.02.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 12:02:40 -0700 (PDT)
Date: Tue, 28 May 2019 12:02:39 -0700
From: Tejun Heo <tj@kernel.org>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH v2 4/4] drm/amdkfd: Check against device cgroup
Message-ID: <20190528190239.GM374014@devbig004.ftw2.facebook.com>
References: <20190517161435.14121-1-Harish.Kasiviswanathan@amd.com>
 <20190517161435.14121-5-Harish.Kasiviswanathan@amd.com>
 <e547c0a1-e153-c3a6-79bc-67f59f364c3e@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e547c0a1-e153-c3a6-79bc-67f59f364c3e@amd.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+9BnizOCabQkDdyYFoUODFzvXj83s9DouynwLQc1zAo=;
 b=vPZeoGpM1TxM+rkKkDVkj/pk7NjplN75jwOoId2JL3sEUhdp82vzMeQ0BrLfkPmlpv
 8j6SaTx4hbfC4z2optFvqnvYxlQrR/KwVtQtVbHV8o5bEn6GPfhrEW3CD1R3gKB0yR8a
 ar6ngjcK1UwlF9lGj2IxX8XVABFdvomtIoapBuBP1hwQuvbmC3WO3dXLGFRY61Bf6Ihg
 YojYnc9v7viqOHt+w8M3FL4G6MC5ijYel/0VDKBEQ4WYGeNiMWymsff+b9nL7+VH5stZ
 sroJGWWwChj5gdmlIPBUS1pVd9qwdq92JlQYPD+p0ix1h58hROUG0o8EyO4m/FMxj3z7
 tZBg==
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
Cc: "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Kasiviswanathan,
 Harish" <Harish.Kasiviswanathan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiBGcmksIE1heSAxNywgMjAxOSBhdCAwODoxMjoxN1BNICswMDAwLCBLdWVobGlu
ZywgRmVsaXggd3JvdGU6Cj4gUGF0Y2hlcyAxLDIsNCB3aWxsIGJlIHN1Ym1pdHRlZCB0aHJvdWdo
IGFtZC1zdGFnaW5nLWRybS1uZXh0LiBQYXRjaCAzIAo+IGdvZXMgdGhyb3VnaCB0aGUgY2dyb3Vw
IHRyZWUuIFBhdGNoIDQgZGVwZW5kcyBvbiBwYXRjaCAzLiBTbyBzdWJtaXR0aW5nIAo+IHBhdGNo
IDQgd2lsbCBuZWVkIHRvIHdhaXQgdW50aWwgd2UgcmViYXNlIGFtZC1zdGFnaW5nLWRybS1uZXh0
IG9uIGEgbmV3IAo+IGVub3VnaCBrZXJuZWwgcmVsZWFzZSB0aGF0IGluY2x1ZGVzIHBhdGNoIDMu
Cj4gCj4gUGF0Y2ggMSBhbmQgMiBjb3VsZCBiZSBzdWJtaXR0ZWQgbm93IG9yIHdhaXQgZm9yIHBh
dGNoIDMgYXMgd2VsbCBzbyB3ZSAKPiBzdWJtaXQgYWxsIG91ciBjZ3JvdXAgc3R1ZmYgaW4gYW1k
Z3B1IGFuZCBLRkQgdG9nZXRoZXIuIEl0IHByb2JhYmx5IAo+IG1ha2VzIG1vc3Qgc2Vuc2UgdG8g
d2FpdCBzaW5jZSB1bnVzZWQgY29kZSB0ZW5kcyB0byByb3QuCj4gCj4gUGF0Y2hlcyAxLDIsNCBh
cmUgYWxyZWFkeSByZXZpZXdlZCBieSBtZS4gRmVlbCBmcmVlIHRvIGFkZCBteSBBY2tlZC1ieSAK
PiB0byBwYXRjaCAzLgoKUGxlYXNlIGZlZWwgZnJlZSB0byBhZGQgbXkgYWNrZWQtYnkgYW5kIHRh
a2UgcGF0Y2ggMyB3aXRoIHRoZSByZXN0IG9mCnRoZSBwYXRjaHNldC4KClRoYW5rcy4KCi0tIAp0
ZWp1bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

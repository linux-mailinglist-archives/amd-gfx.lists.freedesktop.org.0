Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2CBB48DE
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 10:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4CC6EB3D;
	Tue, 17 Sep 2019 08:10:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5267A6EB3D
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 08:10:55 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id l11so2066615wrx.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 01:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mWUWTkC9I9tEECez6QFph1vWwLyQEHYBv6g6Xazz498=;
 b=dkKuzfGKFGtZ8VyrQ8F6NHMG7dNix7xIbN0wZyPvsVNQNU2QEwKsJfOsUvEg/PJcMM
 elN7+0RDAlufRK55LjrDGXTxpJW+XI8V/PksPYLOE0M15PSM5zKn7rh2JedMtaWSq64t
 rqoropmspevhJ/B8h07itKBlY5c7rSX3D6braga217J0qfF5BcxnLKEw0fdsgE0mD52A
 UZ/buprgX1Gp6fjQicKRWYvkLzngcAbrSMSgGhAaHH6xnfvJxwp3Gw0FvgKVlMf2ragb
 KWABei1VXQunRJe5PvUhnv+6aQs9/2NIjaqQN7aZQDGWcpA+qTkGa4bgUTLpbeUJ5Qcm
 PYCw==
X-Gm-Message-State: APjAAAVf8NcEPYlSU3/Ztt5g1noaX63rN1zws8hBGF575cb1Pvty4mjB
 8zVD+MIi7+dTbV2A1iz9W5/37Imi
X-Google-Smtp-Source: APXvYqw9BzXrybbx64f5/A8r13PxQ0SYxrsWAZPE7oMHmqDNeRzIdwkqiWnopGkiAriHIvtA2C+lHQ==
X-Received: by 2002:adf:f151:: with SMTP id y17mr1806296wro.244.1568707853826; 
 Tue, 17 Sep 2019 01:10:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d9sm2778638wrc.44.2019.09.17.01.10.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 01:10:52 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: cleanup creating BOs at fixed location
To: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190913120800.96299-1-christian.koenig@amd.com>
 <64e98754-d747-4004-4e8c-51a3e8bc454e@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b52f0c94-01a5-2932-db96-66ab0da47324@gmail.com>
Date: Tue, 17 Sep 2019 10:10:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <64e98754-d747-4004-4e8c-51a3e8bc454e@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mWUWTkC9I9tEECez6QFph1vWwLyQEHYBv6g6Xazz498=;
 b=X8vkYoIcVZLozAeJnRgfbGbYk9NKB/lFRmVYjpeG+TwOyAOAb8A8eQn8SAUfowOBv7
 rIZaGveyO2r2EQjzVLk50NSjxv6Sjp2Q2LibOvvOp77gQ00AwPm3QNwO+BsRC5b8lhRI
 k0tEuujiAuwK3yZCrzJ6ElRNlAO2Y4O4KQWIXzI51hsHxN7U1mzESiz1aJ0e0jYlmbXK
 l+wIQMncucf7pwHxuLX+xAE5Z8zY73m3zDwpI+NgmMmHnAOEoeMMmTRoeJM5Zx7Z4X5o
 UnySQQ4y5Yp3gl6XGGrpT6ooJKIlh31MAB11vuARALT8OG82lRsjSZZRrVvWAxq9V51s
 PYAw==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTYuMDkuMTkgdW0gMjI6MDYgc2NocmllYiBMaSwgU3VuIHBlbmcgKExlbyk6Cj4KPiBPbiAy
MDE5LTA5LTEzIDg6MDggYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gW1NOSVBdCj4+
IC0JCWlmIChhbWRncHVfcmFzX3Jlc2VydmVfdnJhbShhZGV2LCBicCA8PCBQQUdFX1NISUZULAo+
PiAtCQkJCQlQQUdFX1NJWkUsICZibykpCj4+ICsJCWlmIChhbWRncHVfYm9fY3JlYXRlX2tlcm5l
bF9hdChhZGV2LCBicCA8PCBQQUdFX1NJWkUsIFBBR0VfU0laRSwKPiBJJ20gZ2V0dGluZyBhIGNv
bXBpbGUgd2FybmluZyBmcm9tIHRoZSBhYm92ZSBsaW5lOgo+Cj4gZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5jOjE0MDg6NDM6IHdhcm5pbmc6IGxlZnQgc2hpZnQgY291bnQg
Pj0gd2lkdGggb2YgdHlwZSBbLVdzaGlmdC1jb3VudC1vdmVyZmxvd10KPiAgIDE0MDggfCAgIGlm
IChhbWRncHVfYm9fY3JlYXRlX2tlcm5lbF9hdChhZGV2LCBicCA8PCBQQUdFX1NJWkUsIFBBR0Vf
U0laRSwKPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefgo+Cj4gU2hvdWxkIGl0IGJlIDw8IFBBR0VfU0hJRlQ/CgpZZWFoLCBBbGV4IGFscmVhZHkg
Zml4ZWQgdGhhdCB1cCB5ZXN0ZXJkYXkuIFNvcnJ5IHRoYXQgSSBkaWRuJ3Qgbm90aWNlZCAKYWxs
IHRob3NlIHR5cG9zIGVhcmxpZXIsIGJ1dCBJIGRvbid0IGhhdmUgaGFyZHdhcmUgdG8gdGVzdCB0
aGlzLgoKQ2hyaXN0aWFuLgoKPgo+IFRoYW5rcywKPiBMZW8KPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4

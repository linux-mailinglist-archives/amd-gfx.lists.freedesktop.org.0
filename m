Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627CF41E75
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 09:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9D189316;
	Wed, 12 Jun 2019 07:58:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0087189316
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 07:58:57 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c66so5491577wmf.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 00:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=gXgRFllmUcPejqSxfXzgeUAg/q1Hh+v36fbSs4NdqiU=;
 b=S9c++OU8MkTb7lbczQaXDmjiY8zRayCnT6hKLF4jKc1dClhAnsWGnyw/U4eUNqTzzL
 Jx5Q/qzVZWqL1EnIIy4bCqDTgUy2bdcbb2RVsYTtQptPsTLR2Y+g/fEB2Jxz9A6pAObK
 3uPlaYXvdgeGDGpipV6I4xptl1uPl8ds9AIuKl77VDhdGZC3VldoE/Eip3AnriS0E7xc
 cIzRmzW83wr7I38MqsKvQ11ls3FQFnnzIjp0MIrC2KmWn6bQx1jslSgDuakCNT9EkV1a
 jZcsWmWZR1RQX9M+U3Lc23uEIzpn5AmG0fun4GWo1KF8ZTcBXM1VwPD5k2KOETyjTEJ9
 7PwA==
X-Gm-Message-State: APjAAAVWRDd68xgXBdhgPCEBtEhqUlGHqRBJ9TfOztIH4LldsA4xH3Bx
 TLYBoxBgXa4E2D9PC0cbJ8YUEPqk
X-Google-Smtp-Source: APXvYqzCQbaNfXSg+NWY+yBaFjSpnQudptEkJ51x/DjYgjD0Ovn1G2Ja1bO4SwLvZKQgQK+KtF0M3w==
X-Received: by 2002:a1c:9cd1:: with SMTP id
 f200mr18706225wme.157.1560326336666; 
 Wed, 12 Jun 2019 00:58:56 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f20sm4121245wmh.22.2019.06.12.00.58.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 00:58:56 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Reserve space for shared fence
To: "Zeng, Oak" <Oak.Zeng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1560270022-4934-1-git-send-email-Oak.Zeng@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <567a4212-9d37-140f-7f1b-7d1cd8a33cfc@gmail.com>
Date: Wed, 12 Jun 2019 09:58:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560270022-4934-1-git-send-email-Oak.Zeng@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gXgRFllmUcPejqSxfXzgeUAg/q1Hh+v36fbSs4NdqiU=;
 b=rMyhiMO0bAUDPV11kgiQeLwlXjbOrMFlw7/Jj3HHQPxHopCLX6RfVWsOECorissDu+
 T7LZxrdqFXaBtdTrHfIcKeB2osZSdrQVnoha/uujyK9xqZqyOUQ4qXXHlPbuqrbglzP5
 Ie9EMb52+EYy36TWBntjeDcmg1VKPOsOHnof6ryFt2d+8a8nJHEGy36FDE7R/70zoYX3
 gOBYqRcqRIwff2RCitNgl9/s/yz9ffBV5bjDYDi5nnShlww9CIeJ2chAHXNIy4d4O2o/
 b3Vin8EHFJtr8tsmGj4YT/2eDeIV+QmRKFYZUKg6U5ovHny/IUr3DpNGbluOrqDS/2p5
 ylVw==
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTEuMDYuMTkgdW0gMTg6MjAgc2NocmllYiBaZW5nLCBPYWs6Cj4gQ2FsbCByZXNlcnZhdGlv
bl9vYmplY3RfcmVzZXJ2ZV9zaGFyZWQgdG8gcmVzZXJ2ZQo+IHNwYWNlIGZvciBzaGFyZWQgZmVu
Y2UuIE90aGVyd2lzZSBpdCB3aWxsIHRyaWdnZXIKPiBCVUdfT04gY29uZGl0aW9uIGluIHJlc2Vy
dmF0aW9uX29iamVjdF9hZGRfc2hhcmVkX2ZlbmNlLgo+Cj4gQ2hhbmdlLUlkOiBJYjBmYWUxNjI0
N2UzM2VlNjhmOTViZmZhNzIzNDUxYzBjZDYxOTM0NAo+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5n
IDxPYWsuWmVuZ0BhbWQuY29tPgoKQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkX2dwdXZtLmMgfCA0ICsrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMKPiBpbmRleCA4MWUwZTc1Li43NGU4Njk1IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwo+IEBAIC0yMTUyLDEy
ICsyMTUyLDE2IEBAIGludCBhbWRncHVfYW1ka2ZkX2FkZF9nd3NfdG9fcHJvY2Vzcyh2b2lkICpp
bmZvLCB2b2lkICpnd3MsIHN0cnVjdCBrZ2RfbWVtICoqbWVtCj4gICAJICogQWRkIHByb2Nlc3Mg
ZXZpY3Rpb24gZmVuY2UgdG8gYm8gc28gdGhleSBjYW4KPiAgIAkgKiBldmljdCBlYWNoIG90aGVy
Lgo+ICAgCSAqLwo+ICsJcmV0ID0gcmVzZXJ2YXRpb25fb2JqZWN0X3Jlc2VydmVfc2hhcmVkKGd3
c19iby0+dGJvLnJlc3YsIDEpOwo+ICsJaWYgKHJldCkKPiArCQlnb3RvIHJlc2VydmVfc2hhcmVk
X2ZhaWw7Cj4gICAJYW1kZ3B1X2JvX2ZlbmNlKGd3c19ibywgJnByb2Nlc3NfaW5mby0+ZXZpY3Rp
b25fZmVuY2UtPmJhc2UsIHRydWUpOwo+ICAgCWFtZGdwdV9ib191bnJlc2VydmUoZ3dzX2JvKTsK
PiAgIAltdXRleF91bmxvY2soJigqbWVtKS0+cHJvY2Vzc19pbmZvLT5sb2NrKTsKPiAgIAo+ICAg
CXJldHVybiByZXQ7Cj4gICAKPiArcmVzZXJ2ZV9zaGFyZWRfZmFpbDoKPiAgIGJvX3ZhbGlkYXRp
b25fZmFpbHVyZToKPiAgIAlhbWRncHVfYm9fdW5yZXNlcnZlKGd3c19ibyk7Cj4gICBib19yZXNl
cnZhdGlvbl9mYWlsdXJlOgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

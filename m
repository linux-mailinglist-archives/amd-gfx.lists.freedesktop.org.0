Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9DD342B61
	for <lists+amd-gfx@lfdr.de>; Sat, 20 Mar 2021 10:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D116EB4B;
	Sat, 20 Mar 2021 09:05:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FA66EB4B
 for <amd-gfx@lists.freedesktop.org>; Sat, 20 Mar 2021 09:05:28 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id b9so13380388ejc.11
 for <amd-gfx@lists.freedesktop.org>; Sat, 20 Mar 2021 02:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/SnYSRc64WAa2gwhbo5sdXGIjg7UagqIehiWKW0yM2A=;
 b=Hig0UVYocZQijK1RNrgt6lWjqu/CjGR63SzS+WbeN5OCCSi6YoWRlwnJk0onWdpcKb
 aE6lHuz1S8HFNr7RVYObx1d9pCEM27on5kXDqhCAQs+FBCPR/GFvb/Hq5oSp1lCwXCTJ
 FnJsk3TTFMtjHei89V/2T0rgN/gNyFaknqgMQEu6/cGEqXHX9m8EV8D9RSngTWGMCNbp
 Mifx+i2qboVMyRp0xrpQa8cvSmX88IKzM6BLj/OFvyzV6i7h+DylOWQ/bvZf2hGkCT5N
 08rC6zsN3dVBMxpKy+I+uJ4J4k4gONOF067ejvYYpHCRKpKTqmroASebWpi4WIEjOTj+
 Gw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/SnYSRc64WAa2gwhbo5sdXGIjg7UagqIehiWKW0yM2A=;
 b=NqX8UlpZ6KCeEjkD30YcVITygiHRe+TBiv9TzUce2Kl/6hXmn/TPEAMU9SkAfQnLOt
 EGmtRo4IS/6IwsduycP0clxTVsza2vb9z0hCtX6DQdtqlSV1jv2CaJrBtXk45l1aaE/l
 QtIUkynAgOADWu5nkg8FlRa+CmBApeRjvZ1wmk5To8Y/wXInAR2O4iRS01zlWtDtXg0T
 6CJfY6B11t5zOrLk4MOkc9KebMn6FKmMqkJ/N5QduE31q2m2XIk/GXITBXnvRKIwOW5O
 S4IOHJD2GMWvms8HwFrl+qOVtYdf73bOPTyjY2hDtaBEYnNdvjIs2h0z4qdgnHZmcDsq
 Cosw==
X-Gm-Message-State: AOAM532WdoL/wmFQu3Uk0XvqjuMQEmRWwJR1ZDUKaIFlr/ABDPl30ALH
 splYUndKgC3ZrB09T9omVcvFG3BTU5M=
X-Google-Smtp-Source: ABdhPJxcnxZSW2+uSHePUT+XRn3fbS3QsHd/8Zp58UKR8Wzei7AZGO7NrZl48YA/T+sTZRurwA/JOQ==
X-Received: by 2002:a17:906:ca02:: with SMTP id
 jt2mr8825682ejb.312.1616231126770; 
 Sat, 20 Mar 2021 02:05:26 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9bf8:4d2c:9d22:7a29?
 ([2a02:908:1252:fb60:9bf8:4d2c:9d22:7a29])
 by smtp.gmail.com with ESMTPSA id g26sm4896171ejz.70.2021.03.20.02.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 02:05:26 -0700 (PDT)
Subject: Re: [PATCH 1/1] drm/amdgpu: fix amdgpu_res_first()
To: Nirmoy Das <nirmoy.das@amd.com>, Christian.Koenig@amd.com
References: <20210319190823.42905-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e8378184-5c4f-10e6-50a9-6ed21c9e697f@gmail.com>
Date: Sat, 20 Mar 2021 10:05:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210319190823.42905-1-nirmoy.das@amd.com>
Content-Language: en-US
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
Cc: amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTkuMDMuMjEgdW0gMjA6MDggc2NocmllYiBOaXJtb3kgRGFzOgo+IEZpeCBzaXplIGNvbXBh
cmlzb24gaW4gdGhlIHJlc291cmNlIGN1cnNvci4KPgo+IFNpZ25lZC1vZmYtYnk6IE5pcm1veSBE
YXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jlc19jdXJzb3IuaCB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yZXNfY3Vyc29yLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmVzX2N1cnNvci5oCj4gaW5kZXggYjQ5YTYxZDA3ZDYwLi40MGYyYWRmMzA1
YmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jlc19j
dXJzb3IuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yZXNfY3Vy
c29yLmgKPiBAQCAtNjQsNyArNjQsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYW1kZ3B1X3Jlc19m
aXJzdChzdHJ1Y3QgdHRtX3Jlc291cmNlICpyZXMsCj4gICAJQlVHX09OKHN0YXJ0ICsgc2l6ZSA+
IHJlcy0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQpOwo+ICAgCj4gICAJbm9kZSA9IHJlcy0+bW1f
bm9kZTsKPiAtCXdoaWxlIChzdGFydCA+IG5vZGUtPnNpemUgPDwgUEFHRV9TSElGVCkKPiArCXdo
aWxlIChzdGFydCA+PSBub2RlLT5zaXplIDw8IFBBR0VfU0hJRlQpCj4gICAJCXN0YXJ0IC09IG5v
ZGUrKy0+c2l6ZSA8PCBQQUdFX1NISUZUOwo+ICAgCj4gICAJY3VyLT5zdGFydCA9IChub2RlLT5z
dGFydCA8PCBQQUdFX1NISUZUKSArIHN0YXJ0OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cg==

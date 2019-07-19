Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E64026E1BB
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 09:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EE56E5B4;
	Fri, 19 Jul 2019 07:32:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E167B6E5B4
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 07:32:33 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id l2so27992400wmg.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 00:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=THMk+O418iff41rtMSc3eqEHkROOflZy6F0CCp+lntQ=;
 b=qm6DzKtVt+1/Ckni22LN7z0wfeKi5Ab0Fim7d+Nyzl+gG0XnMYegVA/wSj7JyzpvBa
 L/4LO/TsvN6gR26P3uKo1TIHGJFfVrtZf4k6FJovSStVsnHD085t+hKN3nStb7WfcHRx
 yrffXoZNCa/WkyFzyH1lVD/0PPWjfvFfhLAGjRTI+vGprbpb2XozBMJBSy7t5RGfTU1Q
 mGWS3nzWHtZi3LghT2DZIRU0Lnw0BGMlfWj+kkdqoQwd5n2i4EEx8wXkI4czc5aG72RF
 388Aoif/W6+gfrF4juwmnx6chTUXyhlYqrQ7x46EDiH50IfHUrxMgusH4wLsocewnMC/
 LKkQ==
X-Gm-Message-State: APjAAAULi13mxEWqutOymsgC2KSnYqZm894++8Em+DHJQKw55rtzo0kf
 360B/XqJEIH4VUq98bYoaiaKBTvQ
X-Google-Smtp-Source: APXvYqyGopClFafIkwvLCnFrxh1kTahx3TmmrjuNGni/cPDdGpmWRddvkOiUxpJBwRh/fNV8oR1A6w==
X-Received: by 2002:a1c:a481:: with SMTP id
 n123mr43357051wme.123.1563521552378; 
 Fri, 19 Jul 2019 00:32:32 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r12sm37132671wrt.95.2019.07.19.00.32.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 00:32:31 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: use VCN firmware offset for cache window
To: "Liu, Leo" <Leo.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190718154616.14841-1-leo.liu@amd.com>
 <20190718154945.15004-1-leo.liu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ebd4bfbf-2c08-8a54-fba4-2a8bf347fc0f@gmail.com>
Date: Fri, 19 Jul 2019 09:32:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718154945.15004-1-leo.liu@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=THMk+O418iff41rtMSc3eqEHkROOflZy6F0CCp+lntQ=;
 b=prw4i4+1gtJodTunzLsozbgelNFMOKSEtPBJZHPtI52IXUivV4BTMCaeI8YAXEhx2r
 jja4Abc/NVXh5RYYNFUGHjnBQlexa2evXgTaC8aYca00ukWEQhjbivjor4N11B+iJHKW
 n+0sHrfCFXvV/EbOyMKuQb33S5jLMRmC3eSoINLyXdoFxZDkv/s+igclB4vhoFYMcXM2
 U6Idst7bAAoIMbSw2n0BiwQuUXPUTjpcFcLYqOduJzHEWeo3sc7R7hBvzfsV24SlGTMN
 U249gAuJjbHzzD1Chd2sqOKzM2SXcm87+zZ0ubZ5NiXP68YmvJFPhviVG6jtnnybVRIl
 eSEg==
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

QW0gMTguMDcuMTkgdW0gMTc6NDkgc2NocmllYiBMaXUsIExlbzoKPiBTaW5jZSB3ZSBhcmUgdXNp
bmcgdGhlIHNpZ25lZCBGVyBub3csIGFuZCBhbHNvIHVzaW5nIFBTUCBmaXJtd2FyZSBsb2FkaW5n
LAo+IGJ1dCBpdCdzIHN0aWxsIHBvdGVudGlhbCB0byBicmVhayBkcml2ZXIgd2hlbiBsb2FkaW5n
IEZXIGRpcmVjdGx5Cj4gaW5zdGVhZCBvZiBQU1AsIHNvIHdlIHNob3VsZCBhZGQgb2Zmc2V0Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKQWNrZWQtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jIHwgMyAtLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3Zjbl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5j
Cj4gaW5kZXggM2NiNjJlNDQ4YTM3Li44OGUzZGVkY2Y5MjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3Zjbl92Ml8wLmMKPiBAQCAtMzc5LDExICszNzksOCBAQCBzdGF0aWMgdm9pZCB2
Y25fdjJfMF9tY19yZXN1bWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAJCVdSRUcz
Ml9TT0MxNShVVkQsIDAsIG1tVVZEX0xNSV9WQ1BVX0NBQ0hFXzY0QklUX0JBUl9ISUdILAo+ICAg
CQkJdXBwZXJfMzJfYml0cyhhZGV2LT52Y24uaW5zdC0+Z3B1X2FkZHIpKTsKPiAgIAkJb2Zmc2V0
ID0gc2l6ZTsKPiAtCQkvKiBObyBzaWduZWQgaGVhZGVyIGZvciBub3cgZnJvbSBmaXJtd2FyZQo+
ICAgCQlXUkVHMzJfU09DMTUoVVZELCAwLCBtbVVWRF9WQ1BVX0NBQ0hFX09GRlNFVDAsCj4gICAJ
CQlBTURHUFVfVVZEX0ZJUk1XQVJFX09GRlNFVCA+PiAzKTsKPiAtCQkqLwo+IC0JCVdSRUczMl9T
T0MxNShVVkQsIDAsIG1tVVZEX1ZDUFVfQ0FDSEVfT0ZGU0VUMCwgMCk7Cj4gICAJfQo+ICAgCj4g
ICAJV1JFRzMyX1NPQzE1KFVWRCwgMCwgbW1VVkRfVkNQVV9DQUNIRV9TSVpFMCwgc2l6ZSk7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

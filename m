Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5E2921BA
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 12:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7DF6E0CF;
	Mon, 19 Aug 2019 10:56:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4BB6E0CF
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 10:56:47 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l2so1206926wmg.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 03:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WTVgBtm582Yucwc587gNnwTktde0l8psEE2vJfbQqEU=;
 b=Rqmir16QkYUCiLR3d+f/hkI9rpEbERD7K51tM640Y9pS+ZO99gn57mAUKCgapkGWuM
 aEJNZQen+ZVoMTl4984rvsdCf46XWAxKL0UZX23O1k5aoQ2qwCN2VeHtbMsHEEzTe1aq
 1fwAmCurE7USzDieC0bycMHFdmdmNrXEasflliU2b+/+RCx34Px+xy9RA1RnnwAum6z8
 /oY02zK/0WWbxWXsHnrks96apJP6+cgSBiAdnO2RPQ2zwie0BTHvfDZMSPDXCq9FuuKB
 yoy0YFg2T7fg+uEJifKjdMKk7nxBXfIhvVWosKrgvkF18dGECt/+8HIXEQgokDy0UtHq
 fN5Q==
X-Gm-Message-State: APjAAAUtOOrk4rHzs96t73s6xUZ4NZjGp6p021gyZHFuuFc/GnWz0txX
 1w0So0ulTI6WbUliHTbt71Qajs42
X-Google-Smtp-Source: APXvYqxs4ZlGdJB+9RvNflpi1N0DNnQxPhfPxEmATv8NBoKoqU4fjx6QW0n/ZvlC26EMIVAa+e/ZKw==
X-Received: by 2002:a1c:c706:: with SMTP id x6mr20339649wmf.104.1566212205654; 
 Mon, 19 Aug 2019 03:56:45 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 74sm25879357wma.15.2019.08.19.03.56.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Aug 2019 03:56:45 -0700 (PDT)
Subject: Re: [PATCH 1/3] amd/amdgpu: add Arcturus vf DID support
To: "Frank.Min" <Frank.Min@amd.com>, amd-gfx@lists.freedesktop.org
References: <1565945960-21236-1-git-send-email-Frank.Min@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <633dcb44-d3ba-15b1-e3f7-31f37569142b@gmail.com>
Date: Mon, 19 Aug 2019 12:56:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565945960-21236-1-git-send-email-Frank.Min@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WTVgBtm582Yucwc587gNnwTktde0l8psEE2vJfbQqEU=;
 b=ctH74NFWkIOQEMi95GOJjdrtEB3CfWqHgQrbWwrknE0v1rxZOpRfP5UOuy74w2ZCX+
 z4788tQFrIEMm+e5kQJcpN1XlN95FBvcojkXaUpehtoJ854bWufYCyiTZYwY3e+Bf6yq
 gGhInQ8sPWUolLmzAI1pxaMnAsRPzQgqlhcgAakvEFHC1gAccf3XHLNjTm7yuWKuCQb0
 vfFIncrnQ2sV12UaIUJdeYwIy6m/Ru0X9zuGex/3X2AwLgGvy3d8dcPVEAg3CBhwp4q8
 l2ii8qQ60XmIRaqHZTM0u2cjpDGRVoisWNsO0tBBbHbSdZRQFQRdiMJi0oqe/VAkhRxq
 8/0w==
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

QW0gMTYuMDguMTkgdW0gMTA6NTkgc2NocmllYiBGcmFuay5NaW46Cj4gQ2hhbmdlLUlkOiBJNzE1
MzE1Mzc4NWZkZDU0YTEwZWJjNDdlNzc4ZTA2OTgyZWRjNzlkNwo+IFNpZ25lZC1vZmYtYnk6IEZy
YW5rLk1pbiA8RnJhbmsuTWluQGFtZC5jb20+CgpDYW4ndCBqdWRnZSBpZiB0aGUgdmFsdWVzIGFy
ZSBjb3JyZWN0LCBidXQgZmVlbCBmcmVlIHRvIGFkZCBhbiBBY2tlZC1ieTogCkNocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gdG8gdGhlIGZpcnN0IHR3byBwYXRjaGVz
LgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDEg
Kwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gaW5kZXggMGU4YzE2NS4uMzg5MGJhMiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPiBAQCAtOTk5LDYgKzk5OSw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKPiAgIAl7
MHgxMDAyLCAweDczOEMsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfQVJDVFVS
VVN9LAo+ICAgCXsweDEwMDIsIDB4NzM4OCwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwg
Q0hJUF9BUkNUVVJVU30sCj4gICAJezB4MTAwMiwgMHg3MzhFLCBQQ0lfQU5ZX0lELCBQQ0lfQU5Z
X0lELCAwLCAwLCBDSElQX0FSQ1RVUlVTfSwKPiArCXsweDEwMDIsIDB4NzM5MCwgUENJX0FOWV9J
RCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9BUkNUVVJVU30sCj4gICAJLyogTmF2aTEwICovCj4g
ICAJezB4MTAwMiwgMHg3MzEwLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05B
VkkxMH0sCj4gICAJezB4MTAwMiwgMHg3MzEyLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAw
LCBDSElQX05BVkkxMH0sCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AA449EFA
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 13:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A545E887AE;
	Tue, 18 Jun 2019 11:10:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59F4887AE
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 11:10:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z23so2767879wma.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 04:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OGV+E2n6zqnMOaabczyCyv5AFj/5+eLScHpJBwUjArg=;
 b=C36uYWgBQIYVoGArwAAxl6WuFyItXpm/EbR/OsHrYM5dxxlXEcwiZOamAj+++KKaLI
 Nei48NzuIHrT8p28rs5l1xtI8hGcPdps/TgKNRZul5ZU4m4Sk0GYQabkpQ2/fZPuLqzR
 eKvviCnjW3JjAxowzNKi41e+6UWNwrHALSXmMLbrmqCA4j6t6Ayzya2XptMK4bpsRCSu
 TwmA4riSELVieutaJaXSnvuRe1Nf6+HQOrD5Ean9vxPKQVdO5W3hVYP0CHFo6bjKSMMp
 mKAF64kvpChBcUnZPbz0zbzKFjMUMP3abp7w0td68nZDG8OnWQSt62hM8uapBFLuHoas
 gd0g==
X-Gm-Message-State: APjAAAUId63jVhNHAnaBgB7VKYCdEcTo9kxDPsfekwikuV6ODHlvE+/r
 LrqQq/4e1gdHZ0rlolJrmOs=
X-Google-Smtp-Source: APXvYqymrIlGEnc2zw3eBXkez7LrN7V3+Zui1NVcqKofnZ4W7HeePZpJ+VmtEakTPCZgFMccaEVUBw==
X-Received: by 2002:a05:600c:230b:: with SMTP id
 11mr2990029wmo.85.1560856209620; 
 Tue, 18 Jun 2019 04:10:09 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d18sm21414650wrb.90.2019.06.18.04.10.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 04:10:09 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: add job->preamble_status back to status value
To: "Xiao, Jack" <Jack.Xiao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <1560853789-22977-1-git-send-email-Jack.Xiao@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <817ca792-fbb2-580b-89e6-9edb24caef2e@gmail.com>
Date: Tue, 18 Jun 2019 13:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560853789-22977-1-git-send-email-Jack.Xiao@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=OGV+E2n6zqnMOaabczyCyv5AFj/5+eLScHpJBwUjArg=;
 b=c9yfIT/OWj4CKh9hzuaz2OWuvv4StGL2aSNWH2BwYy7gebxl8me+pl42fsUbTOdRCx
 URNj91o4f6xW9zZu+wNl1+XYJfI1orBZQxn5b7LTERxCpL3iUrUbiOedBEngg9urn96A
 7aa1NX8QUufwUxeSUDze0QjFU9CAAU/QBN8hENSKbFz8KAvSrC7JzR0OunUtfRV4zY8K
 +9UQIxcHO/xQWuT7XdqnQRgnXQXHENZfA8j9XYX8pXNoI+I5ETQRXC+NZrS2WzCyjYou
 +/vBmV+MtglhRGN1OtVJ77Vvgq3fCqgnYD7xyB6f6vaGXazwVtJ01/B3fvtNpkyCmwCF
 KzZw==
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

QW0gMTguMDYuMTkgdW0gMTI6MzEgc2NocmllYiBYaWFvLCBKYWNrOgo+IGpvYi0+cHJlYW1ibGVf
c3RhdHVzIHdhcyBhY2NpZGVudGx5IGRyb3BwZWQgZnJvbSB0aGUgY29tYmluYXRpb24gdmFsdWUK
PiBvZiBzdGF0dXMgdmFyYWlhYmxlIHdoaWNoIGlzIHRoZSBwYXJhbWV0ZXIgb2Ygc29tZSByaW5n
IGxldmVsIGZ1bmN0aW9uLgo+IFRoZSBwYXRjaCBpcyB0byBhZGQgaXQgYmFjay4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+CgpGb3Igbm93IEFja2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+LCBjYXVzZSB3ZSAK
bmVlZCB0byBnZXQgdGhpcyBmaXhlZCBBU0FQLgoKQnV0IG5vdyB0aGUgcXVlc3Rpb24gaXMgd2h5
IGRvIHdlIGFjdHVhbGx5IGhhdmUgdHdvIGZpZWxkcyBpbiB0aGUgam9iIApmb3IgdGhlIHNhbWUg
c3RhdHVzPwoKQ2hyaXN0aWFuLgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9pYi5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jCj4gaW5kZXggOTBjYzA4NC4uNjg4
MmVlYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jCj4gQEAgLTIw
OCw2ICsyMDgsNyBAQCBpbnQgYW1kZ3B1X2liX3NjaGVkdWxlKHN0cnVjdCBhbWRncHVfcmluZyAq
cmluZywgdW5zaWduZWQgbnVtX2licywKPiAgIAo+ICAgCXNraXBfcHJlYW1ibGUgPSByaW5nLT5j
dXJyZW50X2N0eCA9PSBmZW5jZV9jdHg7Cj4gICAJaWYgKGpvYiAmJiByaW5nLT5mdW5jcy0+ZW1p
dF9jbnR4Y250bCkgewo+ICsJCXN0YXR1cyB8PSBqb2ItPnByZWFtYmxlX3N0YXR1czsKPiAgIAkJ
c3RhdHVzIHw9IGpvYi0+cHJlZW1wdGlvbl9zdGF0dXM7Cj4gICAJCWFtZGdwdV9yaW5nX2VtaXRf
Y250eGNudGwocmluZywgc3RhdHVzKTsKPiAgIAl9CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=

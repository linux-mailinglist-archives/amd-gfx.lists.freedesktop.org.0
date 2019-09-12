Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA40B11DF
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Sep 2019 17:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F54D6EDA1;
	Thu, 12 Sep 2019 15:13:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDB86EDA1
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 15:13:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r195so473475wme.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Sep 2019 08:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=kEdZ1OIoP9yCx7/sCYqmBJ/alOzbujdV6s/SKbc0DG4=;
 b=ZsyjXjXVXAwfxMCphulLDB+ilykAR0eNbwhKYUnHg4zRXDmqLUFAuZ6aU/GlEwTu2g
 gihb5/VoC8TJ1XlH+rKDnKZ4IRpPYYKCnkX4E0TzXxgzDHk2OGEH+g4fUI0OsQRKpmM7
 SS3crGD/wi+JmFNqs4P36NHpm1U0rx3A/nYP8qIaGCTgEiJqazjftdGswYhwB3beEpvn
 CnafQVd7tfRDh7z3JkexJ9i7kiOgVr6eNuaGFXTUzCIFBbuDX98MibRjHosZ5x5mtiOa
 m79+lbQ+5FjDowHavEUp55VOUvogGPqNsN3yN+rcNwUU10jJPTSVCGVPgoVDT/FYv1k6
 C+5w==
X-Gm-Message-State: APjAAAXCrnYbrp3bTMxgT9bH/AtoUia9zMxbhlYS2FKNikH7hNlCJfFP
 SMtlf9N+opiRp8x75yI44CFokKUW
X-Google-Smtp-Source: APXvYqxI2YckEQjAEypsIKIy8H06vz9ynXa+4nnWShOlcQfSlPizOvF7nythwtXRksmvKvyAY2cM7Q==
X-Received: by 2002:a1c:9a94:: with SMTP id c142mr425614wme.172.1568301213193; 
 Thu, 12 Sep 2019 08:13:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 33sm28455287wra.41.2019.09.12.08.13.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Sep 2019 08:13:32 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: resvert "disable bulk moves for now"
To: Chunming Zhou <zhoucm1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190912101535.71686-1-christian.koenig@amd.com>
 <f0b19f35-5852-8cbe-2256-e769169d8884@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <df915c16-198d-502d-6eed-975a0471ec13@gmail.com>
Date: Thu, 12 Sep 2019 17:13:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f0b19f35-5852-8cbe-2256-e769169d8884@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=kEdZ1OIoP9yCx7/sCYqmBJ/alOzbujdV6s/SKbc0DG4=;
 b=lH06C1gUIeKT4jBJ1ouoYEMROZYvLtNOuwgW0DP1KHHjwT31mRCYvyPzS5Sb9F1Z9A
 jTNRGWZ2OOxT7/5YDwUtCF7/sdTk/inUuW4gByDIJQMx1qYEjZVikLmofZIq6I4900Y8
 OXRyTnDkRJhpDFS4KjG7N8FAx7dYNw+EzoRG+upLtfq/0S25o7f4zMxcu458J/jZ17kN
 KX0K+uqbAdboobSDHG8J5Lq1C8+EC1u9qC+I6TGqmK5lHCcTwxhUzUbz3VuddrGL7qtX
 BswrgYuvi/DuCp8+gPh2RUNLaZwW0MpmVVQIR58ZmhZbbez2wET417teNwPBeWxAcY1H
 R6hw==
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

SnVzdCB0byBkb3VibGUgY2hlY2s6IFdlIGRvIGhhdmUgdGhhdCBlbmFibGVkIGluIHRoZSBES01T
IHBhY2thZ2UgZm9yIGEgCndoaWxlIGFuZCBkb2Vzbid0IGVuY291bnRlciBhbnkgbW9yZSBwcm9i
bGVtcyB3aXRoIGl0LCBjb3JyZWN0PwoKVGhhbmtzLApDaHJpc3RpYW4uCgpBbSAxMi4wOS4xOSB1
bSAxNjowMiBzY2hyaWViIENodW5taW5nIFpob3U6Cj4gUkIgb24gaXQgdG8gZ28gYWhlYWQuCj4K
PiAtRGF2aWQKPgo+IOWcqCAyMDE5LzkvMTIgMTg6MTUsIENocmlzdGlhbiBLw7ZuaWcg5YaZ6YGT
Ogo+PiBUaGlzIHJldmVydHMgY29tbWl0IGEyMTNjMmM3ZTIzNWNmYzBlMGExNjFhNTU4ZjdmZGYy
ZmIzYTYyNGEuCj4+Cj4+IFRoZSBjaGFuZ2VzIHRvIGZpeCB0aGlzIHNob3VsZCBoYXZlIGxhbmRl
ZCBpbiA1LjEuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPj4gLS0tCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bS5jIHwgMiAtLQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPj4gaW5kZXggNDgzNDll
NGYwNzAxLi5mZDNmYmFhNzNmYTMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bS5jCj4+IEBAIC02MDMsMTQgKzYwMywxMiBAQCB2b2lkIGFtZGdwdV92bV9tb3ZlX3Rv
X2xydV90YWlsKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+PiAgICAJc3RydWN0IHR0bV9i
b19nbG9iYWwgKmdsb2IgPSBhZGV2LT5tbWFuLmJkZXYuZ2xvYjsKPj4gICAgCXN0cnVjdCBhbWRn
cHVfdm1fYm9fYmFzZSAqYm9fYmFzZTsKPj4gICAgCj4+IC0jaWYgMAo+PiAgICAJaWYgKHZtLT5i
dWxrX21vdmVhYmxlKSB7Cj4+ICAgIAkJc3Bpbl9sb2NrKCZnbG9iLT5scnVfbG9jayk7Cj4+ICAg
IAkJdHRtX2JvX2J1bGtfbW92ZV9scnVfdGFpbCgmdm0tPmxydV9idWxrX21vdmUpOwo+PiAgICAJ
CXNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9jayk7Cj4+ICAgIAkJcmV0dXJuOwo+PiAgICAJfQo+
PiAtI2VuZGlmCj4+ICAgIAo+PiAgICAJbWVtc2V0KCZ2bS0+bHJ1X2J1bGtfbW92ZSwgMCwgc2l6
ZW9mKHZtLT5scnVfYnVsa19tb3ZlKSk7Cj4+ICAgIAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3F61C76E
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 13:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8206289269;
	Tue, 14 May 2019 11:04:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93BC89269
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 11:04:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s17so2235101wru.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 04:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=3J1YWCcQuAVJYhIwKsN7mJSbgK1wKsAcWdB5QIR20rU=;
 b=cYnM9bJqpBsb/OHiWvXlL/Z6t5dJHrqm+/4Ina68IeZTRB3GE1W2IccVlafnVkgJzG
 T6VbdO8au6f0SHNQd2zCHXnCpWEWpT89GhAMJQvA5Ze67ppasLOqmLT5vvmlG+behwzH
 JyZHQ+rz7+lB6kGpq1Eq1WMOE40ARa9Cef+Rj9KW4rP+qvV38tOHeVSrF9giCSyLiuoU
 HkBfdgX+/Ijjmmt6P6XAAbR1JY4QuPXQy6IFQgUz9F/tdgUOWog4NtqG+li7gxVZTYo7
 hnxpJ6Aj2ZSD76Kk6q+U3qf6D9fONepVBuOL7vGaq6Lw/fVHB1auB82z73Om2lPy4hP2
 JYlg==
X-Gm-Message-State: APjAAAXscAAIfVa9N2eRurUcutLyBtF+5cDi+hk/+ORt5+Wj/y4i3ixz
 crp7E4zLHwxszzJ5uorohMg=
X-Google-Smtp-Source: APXvYqyklix0uyXNYrrvs6pLd0tG6kKTWNYp5HdxPK9xN3a4rz67wJ1tuDlMnxaWJkOfPmRWwetA5A==
X-Received: by 2002:a5d:45d2:: with SMTP id b18mr11640414wrs.219.1557831894479; 
 Tue, 14 May 2019 04:04:54 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 17sm19550916wrk.91.2019.05.14.04.04.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 04:04:53 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/sriov: Need to initialize the
 HDP_NONSURFACE_BAStE
To: Tiecheng Zhou <Tiecheng.Zhou@amd.com>, amd-gfx@lists.freedesktop.org
References: <1557831559-6925-1-git-send-email-Tiecheng.Zhou@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <82fa6b02-473c-5d83-6cec-7d72fd19f48f@gmail.com>
Date: Tue, 14 May 2019 13:04:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557831559-6925-1-git-send-email-Tiecheng.Zhou@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=3J1YWCcQuAVJYhIwKsN7mJSbgK1wKsAcWdB5QIR20rU=;
 b=K7ZW0Sm3qdzOOgTdNhgSg2ZsvECbyWZCGhmWpaYP8STQOfaPmjhtgh9KF6gY16fDvt
 Ihn0ih5E+7//rXXeah12m9ZCB8Ro6iB+xs/DEx5eVbbNHa3FEMgeXpNYmLLwQcHk3JIV
 YB7qKCJXGb5BbDNY6OxBp8LYg3+V/rVHmWhBAYa7muhgjvo6szdAkUvgOpCpW0paH5Nk
 hulYyWrBYSsQ2AbSZFldwmn4fjBUKT1tmJ+lrg/3wW+EHBapct15EQ9oX7uB67DCt7j6
 zz0JVNtxXrar/f1N+mbr6mOO86hYHLWZVFNUFjcxLhAR8K+0WZBtjnBSkQzYk9glFFNb
 JQCQ==
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTQuMDUuMTkgdW0gMTI6NTkgc2NocmllYiBUaWVjaGVuZyBaaG91Ogo+IGl0IHJlcXVpcmVz
IHRvIGluaXRpYWxpemUgSERQX05PTlNVUkZBQ0VfQkFTRSwgc28gYXMgdG8gYXZvaWQKPiB1c2lu
ZyB0aGUgdmFsdWUgbGVmdCBieSBhIHByZXZpb3VzIFZNIHVuZGVyIHNyaW92IHNjZW5hcmlvLgo+
Cj4gdjI6IGl0IHNob3VsZCBub3QgaHVydCBiYXJlbWV0YWwsIGdlbmVyYWxpemUgaXQgZm9yIGJv
dGggc3Jpb3YKPiBhbmQgYmFyZW1ldGFsCj4KPiBTaWduZWQtb2ZmLWJ5OiBFbWlseSBEZW5nIDxF
bWlseS5EZW5nQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVGllY2hlbmcgWmhvdSA8VGllY2hl
bmcuWmhvdUBhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jIHwgMyArKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwo+IGluZGV4IGJlNzI5ZTcuLmMyMjE1
NzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKPiBAQCAtMTE4MSw2
ICsxMTgxLDkgQEAgc3RhdGljIGludCBnbWNfdjlfMF9nYXJ0X2VuYWJsZShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKPiAgIAl0bXAgPSBSUkVHMzJfU09DMTUoSERQLCAwLCBtbUhEUF9IT1NU
X1BBVEhfQ05UTCk7Cj4gICAJV1JFRzMyX1NPQzE1KEhEUCwgMCwgbW1IRFBfSE9TVF9QQVRIX0NO
VEwsIHRtcCk7Cj4gICAKPiArCVdSRUczMl9TT0MxNShIRFAsIDAsIG1tSERQX05PTlNVUkZBQ0Vf
QkFTRSwgKGFkZXYtPmdtYy52cmFtX3N0YXJ0ID4+IDgpKTsKPiArCVdSRUczMl9TT0MxNShIRFAs
IDAsIG1tSERQX05PTlNVUkZBQ0VfQkFTRV9ISSwgKGFkZXYtPmdtYy52cmFtX3N0YXJ0ID4+IDQw
KSk7Cj4gKwo+ICAgCS8qIEFmdGVyIEhEUCBpcyBpbml0aWFsaXplZCwgZmx1c2ggSERQLiovCj4g
ICAJYWRldi0+bmJpb19mdW5jcy0+aGRwX2ZsdXNoKGFkZXYsIE5VTEwpOwo+ICAgCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

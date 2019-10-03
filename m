Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C44C9985
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 10:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B75B899C7;
	Thu,  3 Oct 2019 08:09:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD866E2B1
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 08:09:41 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v17so1493419wml.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 03 Oct 2019 01:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=z+e6FqX1EQ+xNJq92O6j75nf9WHn1v0tLvYQ3eLYUxQ=;
 b=AHj6A3g8PbqPfU8EXmNjXM8Onu3V1UnhvmMKIaZePFHfW68JGg7a2WZHttIL3Ugz0B
 yD+X+qr6OAY4spQj4RbfiM7OhbjUZrc/y5pzdVlJ1V6zjSsQk/ao+0lrRK7tza0UcKS8
 pFJAjFQ34QpXP55rXgwADNg8YYp2kndERnyJKi08ReqKkvfr4fKYXnA0a7UpKlYyUp8y
 NAUaUwFDnnd6PB63/+3m4LSaplDAIpIVWmZrssOCM542T/1Rb2ncBX9U5xWWOsbGsCZs
 SbQS90jUUs/Bn2rW0m8cVGuXVdhpRkCjuE5qgoa7muIkbwUj1CPAh/DV/p5AMAufTNGy
 PS8A==
X-Gm-Message-State: APjAAAWNs+vUcsirkbzjsuv9ay8vhWz0MvtCdBZ2nczE8WwESU2IoCM5
 DjLLacGqRm6MLTcvZhpwzl9JVyys
X-Google-Smtp-Source: APXvYqxu4lMbucP0ksxiK4DehDVDl5qhWLfHC/SKmfBZWDEc8RzRB6Ht+Hl9f8mDAunXgO766Vn44w==
X-Received: by 2002:a1c:9e46:: with SMTP id h67mr6045744wme.48.1570090180094; 
 Thu, 03 Oct 2019 01:09:40 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q10sm4896741wrd.39.2019.10.03.01.09.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Oct 2019 01:09:39 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: do not execute 0-sized IBs
To: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20191003080306.3514-1-pierre-eric.pelloux-prayer@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <12e0b546-faaf-38c3-c0fc-1e713348b62e@gmail.com>
Date: Thu, 3 Oct 2019 10:09:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003080306.3514-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=z+e6FqX1EQ+xNJq92O6j75nf9WHn1v0tLvYQ3eLYUxQ=;
 b=iTf7aBGF1z84+37yMtBe04x6iyNV2FDgS+x1LCZjJEaSLEHHq/AKEPpNxUTSBA+0bX
 96YDIXJwxojMYiLrrup46he7tQ2WAelCPLXAfleDFLAhRDQ25iDxAs3hwsucMIOjHBEq
 3zK80QSv4q91h8YBXHrG5lJRgnAywzyv7DUqX8skXOURDu3KF9M4y5kjt7PYMiqUqhj9
 OGFJBevG4FsrBfq/IGGVMZQVDfSZgyjvrjSGcZeCf167GCxFqn6Kq3GheDtwxwhiHCVO
 YTDmbS/3V8WxbXdZoDBf2GKpczv0J8hPsTaVnXGKcXT8QQYuaxINvo3HhnXzAOqjubfX
 bFLw==
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

QW0gMDMuMTAuMTkgdW0gMTA6MDMgc2NocmllYiBQZWxsb3V4LXByYXllciwgUGllcnJlLWVyaWM6
Cj4gVGhpcyBjYW4gYmUgc2FmZWx5IHNraXBwZWQgZW50aXJlbHkuCj4gVGhpcyBzZWVtcyB0byBo
ZWxwIHdpdGggaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTEx
NDgxLgoKTkFLLCBwbGVhc2UgaW5zdGVhZCBmaXggZ21jX3YxMF8wX2ZsdXNoX2dwdV90bGIgdG8g
aW5jbHVkZSBhdCBsZWFzdCBzb21lIApOT1AgaW4gdGhlIHN1Ym1pdHRlZCBJQnMuCgpDaHJpc3Rp
YW4uCgo+Cj4gU2lnbmVkLW9mZi1ieTogUGllcnJlLUVyaWMgUGVsbG91eC1QcmF5ZXIgPHBpZXJy
ZS1lcmljLnBlbGxvdXgtcHJheWVyQGFtZC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfaWIuYyB8IDUgKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfaWIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jCj4gaW5k
ZXggNjA2NTU4MzRkNjQ5Li5hYTE2M2U2NzlmMWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfaWIuYwo+IEBAIC0yMjcsNiArMjI3LDExIEBAIGludCBhbWRncHVfaWJfc2No
ZWR1bGUoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1bnNpZ25lZCBudW1faWJzLAo+ICAgCQkg
ICAgIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkgLyogZm9yIFNSSU9WIHByZWVtcHRpb24sIFByZWFt
YmxlIENFIGliIG11c3QgYmUgaW5zZXJ0ZWQgYW55d2F5ICovCj4gICAJCQljb250aW51ZTsKPiAg
IAo+ICsJCWlmIChpYi0+bGVuZ3RoX2R3ID09IDApIHsKPiArCQkJLyogT24gTmF2aSBnbWNfdjEw
XzBfZmx1c2hfZ3B1X3RsYiBlbWl0cyAwIHNpemVkIElCICovCj4gKwkJCWNvbnRpbnVlOwo+ICsJ
CX0KPiArCj4gICAJCWFtZGdwdV9yaW5nX2VtaXRfaWIocmluZywgam9iLCBpYiwgc3RhdHVzKTsK
PiAgIAkJc3RhdHVzICY9IH5BTURHUFVfSEFWRV9DVFhfU1dJVENIOwo+ICAgCX0KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782841B3B1
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2019 12:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F7F89B70;
	Mon, 13 May 2019 10:13:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D0089B70
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 10:13:24 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h4so14560602wre.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 03:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QDD1zkhdC/5IUkeJBjaV/K9Mx+yzl0SPfVdLEWfFxQI=;
 b=MC+E/qZb5FqYA1NQfrE5sSRcwjMn94TZmeI0FYR4Kz25gi0nWhRxfMMNEtGmDe3Y/w
 TuxSx0QU/I5BgImNT92p0V2nBMizJEdM5vjdHA0NPWiAnRIih3HZJ13kb/nz/hrV76NA
 vFXv0WHqnz737yzZXRh2Z3VsOjlDgBAnjYk7v83eezVECea499uoH42OcmSPLMo5+HLZ
 5fbO0tjlDgBl4gX3MnI6fbPc57yaG+gQWSHOSt+7pLyMbiytAuUWKe9f3djYc9FkO7XW
 UKLlaYxgI9DpS8uTBWwnOLMf2jRsXkK7wcvkM5WyCEkbAmuTfPanDEqS3upiyBk4kiZI
 iw4Q==
X-Gm-Message-State: APjAAAX6yGH1VehxTpyLZzv/Yab/aShkN8PuBxGXdSfp9gND8wmjOJ+z
 A1nLjPBUoKHRiAzArZ4TmVt/9feg
X-Google-Smtp-Source: APXvYqzQkkmv2Owat+7YpCy9jFA9VWhZhQRrDKFp0x0yr9xIFN5vZTRodNUefaLWxpHb1nA98NfiTQ==
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr16403637wrq.238.1557742403271; 
 Mon, 13 May 2019 03:13:23 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o4sm12121776wmc.38.2019.05.13.03.13.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 03:13:22 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: suppress repeating tmo report
To: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org
References: <1557727298-21050-1-git-send-email-Monk.Liu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <acb3153f-90ea-e4cf-2bd3-020af692a177@gmail.com>
Date: Mon, 13 May 2019 12:13:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557727298-21050-1-git-send-email-Monk.Liu@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QDD1zkhdC/5IUkeJBjaV/K9Mx+yzl0SPfVdLEWfFxQI=;
 b=SSwtWic+3S7UWj4Gq1vDcP/Oj2PShQ4hP30wvi3ljp0YYbteshL6u54yygnonYIs/G
 y5HqjrpF8Wc9qR5zWXi9H8tJXQJF/+CoRwHWOdTZa2K84xiqCxMFIa6TqKGfQzyd5sq+
 ecQ+ZgjSRPl5CRcg6yynNeWTqfqWi+JRqgkE3wQCyIg6JCWMp/KgP5KWhKULIkmJr6KU
 499ZJs0GNHnDdBJOLDk2FogNzkNx089hwq1+qRX0Jf7kihOLWvs60jrxNwh0W91xLIgA
 tMIqJNTk9vgpBjVMle927Oln15Qj6XTzrCOEizKGrW/kZPXIy2Mym9duYMER7bG5BMu7
 zIxg==
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

QW0gMTMuMDUuMTkgdW0gMDg6MDEgc2NocmllYiBNb25rIExpdToKPiBvbmx5IHJlcG9ydCBvbmNl
IHBlciBUTU8gam9iIGFuZCB0aGUgdGltZXIgd291bGQKPiBiZSByZXN0YXJ0ZWQgdXBvbiB0aGUg
am9iIGZpbmlzaGVkIGlmIGl0J3MganVzdCBzbG93Lgo+Cj4gU3VnZ2VzdGVkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTW9u
ayBMaXUgPE1vbmsuTGl1QGFtZC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9qb2IuYyB8IDIgKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
am9iLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMKPiBpbmRleCAx
Mzk3OTQyLi4xNTAwYmI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9qb2IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9q
b2IuYwo+IEBAIC01MSw2ICs1MSw4IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQo
c3RydWN0IGRybV9zY2hlZF9qb2IgKnNfam9iKQo+ICAgCj4gICAJaWYgKGFtZGdwdV9kZXZpY2Vf
c2hvdWxkX3JlY292ZXJfZ3B1KHJpbmctPmFkZXYpKQo+ICAgCQlhbWRncHVfZGV2aWNlX2dwdV9y
ZWNvdmVyKHJpbmctPmFkZXYsIGpvYik7Cj4gKwllbHNlCj4gKwkJZHJtX3NjaGVkX3N1c3BlbmRf
dGltZW91dCgmcmluZy0+c2NoZWQpOwo+ICAgfQo+ICAgCj4gICBpbnQgYW1kZ3B1X2pvYl9hbGxv
YyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdW5zaWduZWQgbnVtX2licywKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

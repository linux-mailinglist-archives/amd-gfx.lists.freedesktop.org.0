Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DD08309E
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 13:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254C36E35B;
	Tue,  6 Aug 2019 11:26:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE176E364
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 11:26:39 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g67so71981798wme.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 06 Aug 2019 04:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=/bvE/+rT0hqQd9DEVs/wAQSXv8Qv9MrLv1HMgeH12XY=;
 b=gCUjLeKvrjcYOppJaI8sZCM6GBkHZAJuejsBgICKIue/HjfRgiBcMYhjTHmN+ZQ+F3
 7b595cKGrnkNu4v9nIYVE8uiINfdRg7pMNgjMKexoZq3Kc+EJBWVANwonMHqRrYrq05/
 1BPB/KNr07ea2z+zuOvzQxcNG7jyUL8Mp4apbbKNPONPr1YN9VB7RfAKXjg5t4OXG2hr
 AQ1Ka7CIWOoGL4GurP2GYtgxuSMYPx0G1vVWejBynQ6tGro3+RO2tgAH8ESvV6n/qxnf
 KxIqPWAhoFmq7FybTYK+gDE/2vlCpd3CBciHXscFbfsVJ43vmaWc1ZXIZw9KLRJzG30S
 9itQ==
X-Gm-Message-State: APjAAAVGc6nzh24m362pmqu9iLfVrWWH7758xLYnRMwzaZP0L0GP5qff
 5oTqWPWJy6s8caX7VMqKIWs=
X-Google-Smtp-Source: APXvYqy+aGW32eLte4S/O5X+3t5EFW+6HZI3ZHqTmkeIaX9Usk34wMHzhohgAORdtpN129ijwTzGzQ==
X-Received: by 2002:a05:600c:34d:: with SMTP id
 u13mr4477382wmd.48.1565090798068; 
 Tue, 06 Aug 2019 04:26:38 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 66sm2286039wrc.83.2019.08.06.04.26.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 04:26:37 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix compile error about readq/writeq on arm
 ARCH
To: Tao Zhou <tao.zhou1@amd.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, hawking.zhang@amd.com, dennis.li@amd.com,
 broonie@kernel.org
References: <20190806103156.3778-1-tao.zhou1@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a19ac490-a803-84c0-5598-e78edbb3447b@gmail.com>
Date: Tue, 6 Aug 2019 13:26:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806103156.3778-1-tao.zhou1@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/bvE/+rT0hqQd9DEVs/wAQSXv8Qv9MrLv1HMgeH12XY=;
 b=OoejvXx4Lwte+KoWCzvOh8zT6a2jBCn5tmxATTCyE1IfLYdWwc2BQe9RRsmiZNHR8T
 K2V0XzrzTGtSil3Zxegj2HgN5p3U2XNUWLm76W6TcX7+XJVnlxGF8DdvDfHU/acDLQxe
 O+TyLzq2AZgNunii/1t23V7R/4DkooMnnNvLI9A54iGISwQfv2nNma0SxzYDaY1Wo0f0
 HTCsXWYRfnz49VqJppdcmvznJE81AuJF/Oz5HtU/AhtffSk9bT8hk8LmlLEXDoxGeKXo
 JLZ6fZA9RxerIfyVcG0dEqIC0Vttho8Al+rOsdZBCalZdfRW6ZF+zVzfO27XpTpVbkBy
 iSoQ==
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
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-build-reports@lists.linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDYuMDguMTkgdW0gMTI6MzEgc2NocmllYiBUYW8gWmhvdToKPiByZWFkcS93cml0ZXEgY2Fu
J3QgYmUgZm91bmQgb24gYXJtIGFyY2hpdGVjdHVyZSwgaW1wbGVtZW50IHRoZW0KPiB3aXRoIDMy
IGJpdHMgb3BlcmF0aW9ucwoKTWhtLCB3YXNuJ3QgdGhlIHdob2xlIHBvaW50IGFib3V0IHVzaW5n
IHJlYWRxL3dyaXRlcSB0aGF0IHdlIG5lZWRlZCAKNjRiaXQgYXRvbWljIG9wZXJhdGlvbnM/CgpD
aHJpc3RpYW4uCgo+Cj4gU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwg
MSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiBpbmRleCBmNjJkNGYzMGU4MTAuLmFhZjdm
MzFjZjhkZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMKPiBAQCAtMjksNiArMjksNyBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4L2t0aHJlYWQuaD4KPiAg
ICNpbmNsdWRlIDxsaW51eC9jb25zb2xlLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+
ICsjaW5jbHVkZSA8bGludXgvaW8tNjQtbm9uYXRvbWljLWxvLWhpLmg+Cj4gICAjaW5jbHVkZSA8
ZHJtL2RybVAuaD4KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4KPiAgICNp
bmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4

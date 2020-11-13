Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1052B1D67
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Nov 2020 15:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4AC6E5BE;
	Fri, 13 Nov 2020 14:28:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2716E4EA
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d142so8200592wmd.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fbx/i6xkdl5U3TCyGHC7OwtokMdU84+FveVergF6/Ok=;
 b=R1shnNVetX4luA2olSUjEUcn8RXbxoyUmnCpZ4pRXk8LujJR/7t/PmhuT/jdLA0YG8
 xdD0sDqtV4pG7nM8HQoEmSLcyNOcnklXEXFWPprk1HzH6oLPRMe5Fr9o0dn+a7JVklBJ
 AOTs4bmp6IjZ4AfdE8x0MIOIsH8NcoCqCq/sRmde2nuqAllLptX0ST7D4MjQoyp6LwXf
 98S1AE24vbzy5BEPTalNeNPn8kzE1W1M1RMP1zwRYbvH1oAKvH6IrHr3iLcroO7PnjzQ
 peUSjRSdghyuoehDuQU18l3Ps2p3pKevRGrvwtdEJPWnF8CIpwUpgVqVQRjVjzMciRnM
 WqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fbx/i6xkdl5U3TCyGHC7OwtokMdU84+FveVergF6/Ok=;
 b=BjB3xeKAXz9K/H4aMkvvRYev8U9iXEtokuFyCDTYYQF4h2mQu78ncarns8j+aWosPm
 p5oWFUy0kXGI6l4P4eyWoMT5jA0egsJQWVx/FDXUdkDNQ3SG2bp/OQR16Zn3mjEhh9dT
 AOnJE0LjRjZuj03sp08lbRH42WJy1lXtTfROvlWE5NtRh43cjDalqSdvojJxv6kYro3c
 Tu9m2eTETjNT8ouL3beoClTMX2HiWDMjXlNP3V8yVjZvagTkwgmH+vDCl5RCKmUtgvyG
 I6aGtbo7ETFTh72uySD92lhrEJjGk+s7W7A4Ih13IUBRQHwfqhix7TEw9A5Ooz36OxRL
 1EcQ==
X-Gm-Message-State: AOAM53339EtOT2C326NTpKz9ADuMCzp4bgZhdtUDa9E0waaDWdO7OL9X
 qp+kZGgVDNLM7YRu/FfPGpg+1g==
X-Google-Smtp-Source: ABdhPJwb2YkE98pyU3fex6KmUTxG2VWK5VdMpzDRBejv+5JxJWIng0MFvboFaeU2oxPsca91cfjeeA==
X-Received: by 2002:a05:600c:2204:: with SMTP id
 z4mr2536234wml.57.1605275408939; 
 Fri, 13 Nov 2020 05:50:08 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:08 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/40] drm/amd/amdgpu/amdgpu_sched: Consume our own header
 containing prototypes
Date: Fri, 13 Nov 2020 13:49:20 +0000
Message-Id: <20201113134938.4004947-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Nov 2020 14:28:19 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Andres Rodriguez <andresx7@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NjaGVkLmM6MzU6NTogd2FybmluZzogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciDigJhhbWRncHVfdG9fc2NoZWRfcHJpb3JpdHnigJkgWy1XbWlz
c2luZy1wcm90b3R5cGVzXQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NjaGVk
LmM6MTIyOjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYYW1kZ3B1X3Nj
aGVkX2lvY3Rs4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KCkNjOiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEx1YmVuIFR1aWtvdiA8bHViZW4u
dHVpa292QGFtZC5jb20+CkNjOiBBbmRyZXMgUm9kcmlndWV6IDxhbmRyZXN4N0BnbWFpbC5jb20+
CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zY2hlZC5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NjaGVkLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2NoZWQuYwppbmRleCAwZGEwYTBkOTg2NzIwLi5i
N2Q4NjFlZDUyODQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfc2NoZWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2NoZWQu
YwpAQCAtMjksNyArMjksNyBAQAogI2luY2x1ZGUgPGRybS9hbWRncHVfZHJtLmg+CiAKICNpbmNs
dWRlICJhbWRncHUuaCIKLQorI2luY2x1ZGUgImFtZGdwdV9zY2hlZC5oIgogI2luY2x1ZGUgImFt
ZGdwdV92bS5oIgogCiBpbnQgYW1kZ3B1X3RvX3NjaGVkX3ByaW9yaXR5KGludCBhbWRncHVfcHJp
b3JpdHksCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eAo=

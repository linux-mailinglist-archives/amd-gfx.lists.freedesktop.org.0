Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091FF48EC1
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFE289954;
	Mon, 17 Jun 2019 19:27:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EFC898FD
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:45 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id l128so6961528qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qAPFQNdxj4C218/10D6OX0r0L0fX755KI0aoApUytBI=;
 b=N8PEa38wG8UgL6Fj3CSPpC/pjsk5Jqo0zzI/GzaRF2KF/kyrdR/8F3CH2fhmMtZyUT
 K2zThsmh2VmHWiQC9z/8K5S8PCwpWOcXKETAVO62AKuLKOTincQyonZxvSftLpKdHdnE
 OR/aWF2mJAQgEoW1aNBYozChmtAYS2ZHe69lwIosPMMFui+SX7bGxha5kSmOi+oOqI9i
 TvuP+yUNBWQ2UCJ9hjXA2ZtSOTtOFqlMWm6E2GOykjKx9vjRMdDxoLo4D8ecs9wxhAhJ
 Ej9SPa8G5/ukPamrR/9QDYOIiw5F4isZ7ZE2Dx9Zuced24qGoUSZlIEJiDQ40ReUjUf/
 T7jQ==
X-Gm-Message-State: APjAAAXACa5yEpe7hgoIFWjMWOh4wEKvWtJgzpjFdJwpXuOWvAC5sMKD
 jz0zJkgQ8TxeaNvlcvlI5ttvuh7yB2E=
X-Google-Smtp-Source: APXvYqxeGIlsiS2BrqCDs1HhhYpxE9+dltF7DNGWznAN8UntdtetDsgNUpIpm/DULEwSMpVkKjfSpQ==
X-Received: by 2002:a37:8a81:: with SMTP id m123mr6911504qkd.360.1560799664431; 
 Mon, 17 Jun 2019 12:27:44 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:43 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 132/459] drm/amdkfd: Introduce DIQ type mqd manager for gfx10
Date: Mon, 17 Jun 2019 14:25:57 -0500
Message-Id: <20190617192704.18038-33-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qAPFQNdxj4C218/10D6OX0r0L0fX755KI0aoApUytBI=;
 b=W4wofMneAu46PCyvzp+CDrqMDCETRO5XhwIwHJqz93FUxZ+ataaZ/A4lzRAoDuZKN3
 /78VdRogfZSthoLsZ4mzTngSgnfqKMIa0OYUNtc1g2V3guj3k3th4BZj+n4u0xCS0yF4
 umedA09AwWzVwm13601Diq1aRT9QCnxlo0K+ezCLGwpM7hEhfplVLHQTYoi6BhpLRi9t
 TnO1wwnnTM/LV4rdYoL9/+TqquS3HK58+N8HV4AQbcrl9tg2Q5A0yZkyFWvbF6vW0a0P
 BcamJ3ruWg4HEBupRA3jW+bwIf28ASUCX097FoPuvhxuao2wtJ6gpCh4xZFKzniV+iPc
 /87A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2l0aCBpbnRyb2R1Y3Rpb24gb2YgbmV3IG1xZCBhbGxvY2F0aW9uIHNjaGVtZSBmb3IgSElRLApE
SVEgYW5kIEhJUSB1c2UgZGlmZmVyZW50IG1xZCBhbGxvY2F0aW9uIHNjaGVtZSwgRElRCmNhbid0
IHJldXNlIEhJUSBtcWQgbWFuYWdlcgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9tcWRfbWFuYWdlcl92MTAuYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfbXFkX21hbmFnZXJfdjEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFk
X21hbmFnZXJfdjEwLmMKaW5kZXggNjY2M2I3MjM3MGY2Li5kYjM5Nzk1MjBmNTQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMKQEAgLTQ5
Nyw2ICs0OTcsMTggQEAgc3RydWN0IG1xZF9tYW5hZ2VyICptcWRfbWFuYWdlcl9pbml0X3YxMChl
bnVtIEtGRF9NUURfVFlQRSB0eXBlLAogI2VuZGlmCiAJCXByX2RlYnVnKCIlc0AlaVxuIiwgX19m
dW5jX18sIF9fTElORV9fKTsKIAkJYnJlYWs7CisJY2FzZSBLRkRfTVFEX1RZUEVfRElROgorCQlt
cWQtPmluaXRfbXFkID0gaW5pdF9tcWRfaGlxOworCQltcWQtPnVuaW5pdF9tcWQgPSB1bmluaXRf
bXFkOworCQltcWQtPmxvYWRfbXFkID0gbG9hZF9tcWQ7CisJCW1xZC0+dXBkYXRlX21xZCA9IHVw
ZGF0ZV9tcWRfaGlxOworCQltcWQtPmRlc3Ryb3lfbXFkID0gZGVzdHJveV9tcWQ7CisJCW1xZC0+
aXNfb2NjdXBpZWQgPSBpc19vY2N1cGllZDsKKwkJbXFkLT5tcWRfc2l6ZSA9IHNpemVvZihzdHJ1
Y3QgdjEwX2NvbXB1dGVfbXFkKTsKKyNpZiBkZWZpbmVkKENPTkZJR19ERUJVR19GUykKKwkJbXFk
LT5kZWJ1Z2ZzX3Nob3dfbXFkID0gZGVidWdmc19zaG93X21xZDsKKyNlbmRpZgorCQlicmVhazsK
IAljYXNlIEtGRF9NUURfVFlQRV9TRE1BOgogCQlwcl9kZWJ1ZygiJXNAJWlcbiIsIF9fZnVuY19f
LCBfX0xJTkVfXyk7CiAJCW1xZC0+aW5pdF9tcWQgPSBpbml0X21xZF9zZG1hOwotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

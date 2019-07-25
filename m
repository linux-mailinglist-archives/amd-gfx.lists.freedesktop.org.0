Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B8C754CC
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 18:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360C66E7AC;
	Thu, 25 Jul 2019 16:58:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707A86E7AB
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 16:58:15 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m14so11284837qka.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 09:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iqBQIQwfgpmvTxgyON02CHPP0etLrAB9Ocp4BjtSYfc=;
 b=DQLZRgGTd/yYE+wfEoIWaAyX0o19QRw83wUGZafCjo7a8LFn9uEbk1j85Sc1ZVIc8y
 buA922Q91P7Q7I3hwpuh9oRYaDGTDuQI4cywZJSlID32Ng9q/HnN+4RlHuIHQgcs/VoS
 IGF4yYIaCZtM8yw3VMsglc+L5Y5x6IC22oK0JUKPJJ5NaZG63TTr0+Ae3KbQKqShgxPZ
 aLfSco6preOjRlgqzXifdtlSRbyjhLvp7RFmHO/agpUl+PRdu6oi8DAQIo03pOV/EvAG
 odz3QPqjGOAm3Y1XBCj4RdxFgdgXGUcWZ94H+PvnT9qUYoCw0ujyOQsfuZBSxV6e8vum
 WXQQ==
X-Gm-Message-State: APjAAAVO5Em17Q9rOa51qocWLSUhr7C9Bi1ao97wbW9UPU6wJC4A+cRD
 sr1bnkh7ogVjcdhVh4YssawUx2ez
X-Google-Smtp-Source: APXvYqyDwP9od0ol1qnSlYITAuYJI4SI2bgyC1mejAcTli+Ojmz/at1eLfDbgLSlAlfrPdBfvHmC5g==
X-Received: by 2002:a05:620a:137c:: with SMTP id
 d28mr59170176qkl.351.1564073894343; 
 Thu, 25 Jul 2019 09:58:14 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id l6sm21157625qkc.89.2019.07.25.09.58.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:58:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 12/12] drm/amdgpu: put the SMC into the proper state on suspend
Date: Thu, 25 Jul 2019 11:57:58 -0500
Message-Id: <20190725165758.16928-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725165758.16928-1-alexander.deucher@amd.com>
References: <20190725165758.16928-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iqBQIQwfgpmvTxgyON02CHPP0etLrAB9Ocp4BjtSYfc=;
 b=gbjXzhpT6AmvcbplII7X9fwhN2tuHP9UaqIQBI6SHUr98Rm2N+wQ5oX9OVRDmrXR4V
 3FmG8au6sF5k3PlHlFILWS+kCBB1tnwOCLX75Y6/xDdYsIuUlHj9h12jL8sTOXI1n1pe
 eI5Eupez4g6X/8lAchNLCcsTdAcBqTl8YX+MLiWlq7TW685PxcJkD+Kp51xgwWsjyn2e
 8FQIIriSrzFyVB66hOSU2IslyHTiFgmjS1fGMbKrgPwamu8I0yI+aR2oSfmQmBF7zCcI
 CcQ1yw8AWDAg3OloB1e31+gpoiJwI+v4FKkneXlv+OQ6b0mTihh79F6ZmAoqQ1SezndW
 zH+Q==
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

U3VzcGVuZCBpcyB1c2VkIGZvciBTMy9TNCwgR1BVIHJlc2V0LCBhbmQgUENJIHNodXRkb3duLiAg
SW4KZWFjaCBjYXNlLCB3ZSBuZWVkIHRvIHB1dCB0aGUgU01DIGludG8gdGhlIHByb3BlciBzdGF0
ZQppbiBvcmRlciB0byByZXN1bWUgb3IgcmVsb2FkIGNvcnJlY3RseS4KClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAzMyArKysrKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCA0NDI1ZmYwNmVjYzQuLmJiNDI2MDY0OGE5
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMjE3
NCw2ICsyMTc0LDM5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9pcF9zdXNwZW5kX3BoYXNl
MihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCURSTV9FUlJPUigic3VzcGVuZCBvZiBJ
UCBibG9jayA8JXM+IGZhaWxlZCAlZFxuIiwKIAkJCQkgIGFkZXYtPmlwX2Jsb2Nrc1tpXS52ZXJz
aW9uLT5mdW5jcy0+bmFtZSwgcik7CiAJCX0KKwkJLyogaGFuZGxlIHB1dHRpbmcgdGhlIFNNQyBp
biB0aGUgYXBwcm9wcmlhdGUgc3RhdGUgKi8KKwkJaWYgKGFkZXYtPmlwX2Jsb2Nrc1tpXS52ZXJz
aW9uLT50eXBlID09IEFNRF9JUF9CTE9DS19UWVBFX1NNQykgeworCQkJZW51bSBwcF9tcDFfc3Rh
dGUgbXAxX3N0YXRlID0gUFBfTVAxX1NUQVRFX05PTkU7CisKKwkJCWlmIChhZGV2LT5pbl9ncHVf
cmVzZXQpIHsKKwkJCQlzd2l0Y2ggKGFtZGdwdV9hc2ljX3Jlc2V0X21ldGhvZChhZGV2KSkgewor
CQkJCWNhc2UgQU1EX1JFU0VUX01FVEhPRF9NT0RFMToKKwkJCQljYXNlIEFNRF9SRVNFVF9NRVRI
T0RfQkFDTzoKKwkJCQkJbXAxX3N0YXRlID0gUFBfTVAxX1NUQVRFX1NIVVRET1dOOworCQkJCQli
cmVhazsKKwkJCQljYXNlIEFNRF9SRVNFVF9NRVRIT0RfTU9ERTI6CisJCQkJCW1wMV9zdGF0ZSA9
IFBQX01QMV9TVEFURV9SRVNFVDsKKwkJCQkJYnJlYWs7CisJCQkJZGVmYXVsdDoKKwkJCQkJbXAx
X3N0YXRlID0gUFBfTVAxX1NUQVRFX05PTkU7CisJCQkJCWJyZWFrOworCQkJCX0KKwkJCX0gZWxz
ZSBpZiAoYWRldi0+aW5fZ3B1X3NodXRkb3duKSB7CisJCQkJbXAxX3N0YXRlID0gUFBfTVAxX1NU
QVRFX1VOTE9BRDsKKwkJCX0KKwkJCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkgeworCQkJ
CS8qIHRvZG8gKi8KKwkJCX0gZWxzZSBpZiAoYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzICYmCisJ
CQkJICAgYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5zZXRfbXAxX3N0YXRlKSB7CisJCQkJciA9
IGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X21wMV9zdGF0ZSgKKwkJCQkJYWRldi0+cG93
ZXJwbGF5LnBwX2hhbmRsZSwKKwkJCQkJbXAxX3N0YXRlKTsKKwkJCQlpZiAocikgeworCQkJCQlE
Uk1fRVJST1IoIlNNQyBmYWlsZWQgdG8gc2V0IG1wMSBzdGF0ZSAlZCwgJWRcbiIsCisJCQkJCQkg
IG1wMV9zdGF0ZSwgcik7CisJCQkJfQorCQkJfQorCQl9CiAJfQogCiAJcmV0dXJuIDA7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CE2D3742
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994976EB96;
	Fri, 11 Oct 2019 01:45:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772C36EB94
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:45:51 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id r5so11708980qtd.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NpT5L6ynOgPWrXsO2osWQG0OMs1eXOILPPvgTLFTdu8=;
 b=laINxcqJim4gM6OetBQ4shuBzfFPgQnDrpJSbXEswOKnumZOwHYoK0xm6SQFqin0Ny
 t0ZEZ7XpTqdqsDARU2leYZO/BEupEGe8agRAW68REYIG2AexGOk+8tbIFcT/LT8zwCCD
 3XG9H+gp+E6ugWk5Cgdo4ykxgqws8cDuFQM1p1J2AoNicOJ2r67ovzf+20g3pZAR2tOJ
 /F2GE8whT244srLqauK+sVfZf/F6fJaiY0GZj0a7PKhMV2hUywmKl9unJrwHUaT9gh48
 qXlMy1n/iUeBUV+rCLRnHglVgRV6yvQW97ZTnMs/vxvCrG3szjjzoUMG2zVOf50iE+4c
 nmqQ==
X-Gm-Message-State: APjAAAVFO7XxEbixBghkXHTvRT3Qax27yizOWlaNRi84Me/ePmXXSaR7
 CFhF3kAYkE5Dvux6R0XArepJkiMp
X-Google-Smtp-Source: APXvYqz+EiMT+OvMHtwXvZxuM1Byj5MF5alJWN6eVO62Riv6iejkFSeCREJJJhcBdKvaY/eO9ZVwSA==
X-Received: by 2002:ac8:36f0:: with SMTP id b45mr14588912qtc.374.1570758350375; 
 Thu, 10 Oct 2019 18:45:50 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:45:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 05/19] drm/amdgpu: add supports_baco callback for VI asics.
Date: Thu, 10 Oct 2019 20:45:22 -0500
Message-Id: <20191011014536.10869-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NpT5L6ynOgPWrXsO2osWQG0OMs1eXOILPPvgTLFTdu8=;
 b=esQEMpb33Hu933ypvadIM0mhQm9rqIOww6iVdpjm0PoVbGmuXEvS1pPbx6Pvot/3I+
 f4N5g2pt5vcI1ZFhSA0i8GlHaOIG8KY3x7O4WMSELsyhQXgMYWcxmb2CmsD1hnHTn6jQ
 zVhltBSuti/IgHedEYQX0mky7alCc16RsmKBB2UMiRLBTSQIipdzZuabH2xhhWK3n7y7
 MFZIs7y++6IKzCvmdDyFpxGuFd9UTHa3m1gMsX3cEa7Spt6HrlCOkL7aYO0bEbJ+zOFU
 /Pn9YO6s34DWpfgLlinkQTzDBRRBq/rhBl3NyUSTjgSEHdTLKNzcJ2CeYzYtVA3sHamb
 Ei9Q==
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

Q2hlY2sgdGhlIEJBQ08gY2FwYWJpbGl0aWVzIGZyb20gdGhlIHBvd2VycGxheSB0YWJsZS4KClNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5jIHwgMjIgKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dmkuYwppbmRleCA3OGU1Y2RjMGMwNTguLjg3MWMwYjhjNmIwYiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS92aS5jCkBAIC03NDUsNiArNzQ1LDI3IEBAIHN0YXRpYyBpbnQgdmlfYXNpY19wY2lfY29uZmln
X3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVybiByOwogfQogCitzdGF0
aWMgYm9vbCB2aV9hc2ljX3N1cHBvcnRzX2JhY28oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
Cit7CisJYm9vbCBiYWNvX3N1cHBvcnQ7CisKKwlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewor
CWNhc2UgQ0hJUF9GSUpJOgorCWNhc2UgQ0hJUF9UT05HQToKKwljYXNlIENISVBfUE9MQVJJUzEw
OgorCWNhc2UgQ0hJUF9QT0xBUklTMTE6CisJY2FzZSBDSElQX1BPTEFSSVMxMjoKKwljYXNlIENI
SVBfVE9QQVo6CisJCXNtdTdfYXNpY19nZXRfYmFjb19jYXBhYmlsaXR5KGFkZXYsICZiYWNvX3N1
cHBvcnQpOworCQlicmVhazsKKwlkZWZhdWx0OgorCQliYWNvX3N1cHBvcnQgPSBmYWxzZTsKKwkJ
YnJlYWs7CisJfQorCisJcmV0dXJuIGJhY29fc3VwcG9ydDsKK30KKwogc3RhdGljIGVudW0gYW1k
X3Jlc2V0X21ldGhvZAogdmlfYXNpY19yZXNldF9tZXRob2Qoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiB7CkBAIC0xMTE2LDYgKzExMzcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdw
dV9hc2ljX2Z1bmNzIHZpX2FzaWNfZnVuY3MgPQogCS5nZXRfcGNpZV91c2FnZSA9ICZ2aV9nZXRf
cGNpZV91c2FnZSwKIAkubmVlZF9yZXNldF9vbl9pbml0ID0gJnZpX25lZWRfcmVzZXRfb25faW5p
dCwKIAkuZ2V0X3BjaWVfcmVwbGF5X2NvdW50ID0gJnZpX2dldF9wY2llX3JlcGxheV9jb3VudCwK
Kwkuc3VwcG9ydHNfYmFjbyA9ICZ2aV9hc2ljX3N1cHBvcnRzX2JhY28sCiB9OwogCiAjZGVmaW5l
IENaX1JFVl9CUklTVE9MKHJldikJIFwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4

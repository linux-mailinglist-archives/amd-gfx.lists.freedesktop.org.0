Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC01CBCCB
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 16:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5656EBA5;
	Fri,  4 Oct 2019 14:15:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEDD6EBA5
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 14:15:39 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id u22so5892035qkk.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 04 Oct 2019 07:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O9/yGyjKgvAPcF2lPAKzELkFbClV7jHHQ5Hpks2Xr3o=;
 b=p6KqXTzTL7thuNrFFe/CHAdsEBex2nROr2haS0L9q0BhonA7AftsL08ySYVS94s9cV
 4vYlAwcCCNw/cSVB0aud7/T6jwDo8bWdLYKJPmxskwiTcbfSdaMbsRsaHZzmTeTG/0CE
 Sq2/icbX7ySghfKTDrUvnTXFxBmnV+AjuFTQZKXd3as10eK6/0vfWEJN4cCVEdFQ9/lD
 aRCCrnHT93s5GhlS/ziiVR2MG2e+KPvlzIZwv3MHn63Ly6bUULP9GablZfJUqqzPIns7
 BbtP8tlW9Qne4+0kfFsjdnLr9yr3jpG3BgIpDe53CHvB130B/gI/0pMoO2aIVF2Tv/r1
 beAg==
X-Gm-Message-State: APjAAAW96fVYRmKb1g0LKc649oSO31/IXHWhF8Dy3RlmqmTgVl0kh4jl
 FPGJ6GPpahNAOkOs2iX225e00zGa
X-Google-Smtp-Source: APXvYqwrNrSvFBQ5gM6OFnwCU+LHR8fKxwFrNWuMrwJitaKIyMuDgzHcsEtjSIT1XgexIM+WZpBV2Q==
X-Received: by 2002:a37:bc84:: with SMTP id
 m126mr10069754qkf.196.1570198538300; 
 Fri, 04 Oct 2019 07:15:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id e7sm2732135qtb.94.2019.10.04.07.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 07:15:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdkfd: fix the build when CIK support is disabled
Date: Fri,  4 Oct 2019 09:15:29 -0500
Message-Id: <20191004141529.5342-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O9/yGyjKgvAPcF2lPAKzELkFbClV7jHHQ5Hpks2Xr3o=;
 b=GPNEsnWFUy4hpWUP0rKTMT/NaeAizIj7H9YguvdscqcSw9Zgpr8sF2J5CgXcWckdOt
 qgbJ87+z7PGPSZzdwlJ/5cmYGkAZZBpDrdsHboEsC+6G3tjmdzob+JAnL1B1DscCq/9W
 Snvq0zV24nNfXEq8n1wkD+WCqa8TS0zN/apPWa7icAJZQzSOuQvVtR+i0xdewkODzw+/
 GpBcFvbtl0gzDCSmkFCJavsltXW1ERJn7FyT7VyezxbsD+JFLSDbKZUyyLMQy6jOBQPF
 6EGlcaDjPP2js0Sfycsz02mtTO0sjEKw57mfTXSSE6jdJARiebTV8BBrmzypbOwNR9uS
 Yqig==
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

QWRkIHByb3BlciBpZmRlZnMgYXJvdW5kIENJSyBjb2RlIGluIGtmZCBzZXR1cC4KClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgfCA2ICsrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZp
Y2UuYwppbmRleCAwZGIyNzM1ODdhZjQuLmQ4OThhZGYyNWZiYiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwpAQCAtMzksNyArMzksOSBAQAogICovCiBzdGF0aWMgYXRv
bWljX3Qga2ZkX2xvY2tlZCA9IEFUT01JQ19JTklUKDApOwogCisjaWZkZWYgQ09ORklHX0RSTV9B
TURHUFVfQ0lLCiBleHRlcm4gY29uc3Qgc3RydWN0IGtmZDJrZ2RfY2FsbHMgZ2Z4X3Y3X2tmZDJr
Z2Q7CisjZW5kaWYKIGV4dGVybiBjb25zdCBzdHJ1Y3Qga2ZkMmtnZF9jYWxscyBnZnhfdjhfa2Zk
MmtnZDsKIGV4dGVybiBjb25zdCBzdHJ1Y3Qga2ZkMmtnZF9jYWxscyBnZnhfdjlfa2ZkMmtnZDsK
IGV4dGVybiBjb25zdCBzdHJ1Y3Qga2ZkMmtnZF9jYWxscyBhcmN0dXJ1c19rZmQya2dkOwpAQCAt
NDcsMTEgKzQ5LDE1IEBAIGV4dGVybiBjb25zdCBzdHJ1Y3Qga2ZkMmtnZF9jYWxscyBnZnhfdjEw
X2tmZDJrZ2Q7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkMmtnZF9jYWxscyAqa2ZkMmtnZF9m
dW5jc1tdID0gewogI2lmZGVmIEtGRF9TVVBQT1JUX0lPTU1VX1YyCisjaWZkZWYgQ09ORklHX0RS
TV9BTURHUFVfQ0lLCiAJW0NISVBfS0FWRVJJXSA9ICZnZnhfdjdfa2ZkMmtnZCwKKyNlbmRpZgog
CVtDSElQX0NBUlJJWk9dID0gJmdmeF92OF9rZmQya2dkLAogCVtDSElQX1JBVkVOXSA9ICZnZnhf
djlfa2ZkMmtnZCwKICNlbmRpZgorI2lmZGVmIENPTkZJR19EUk1fQU1ER1BVX0NJSwogCVtDSElQ
X0hBV0FJSV0gPSAmZ2Z4X3Y3X2tmZDJrZ2QsCisjZW5kaWYKIAlbQ0hJUF9UT05HQV0gPSAmZ2Z4
X3Y4X2tmZDJrZ2QsCiAJW0NISVBfRklKSV0gPSAmZ2Z4X3Y4X2tmZDJrZ2QsCiAJW0NISVBfUE9M
QVJJUzEwXSA9ICZnZnhfdjhfa2ZkMmtnZCwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4

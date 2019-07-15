Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A7569E26
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C818B89F0B;
	Mon, 15 Jul 2019 21:25:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD1A89EFF
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:31 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id k10so17320251qtq.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zLeC+0BT4SiSZKKtcLXd3N8rhGEhfNO/Zfhc+8FWBgc=;
 b=P3e68goxIsdc8340GFucQlybaOPW2QpHVF1tCLLfUBqKmF2ltWOG76HiQZ9+rDZLn7
 5SlQVN5RKApfGVtwBrG/CQVnMV3awHOKunojuPIA8qhiinVyIA6WEtB+Snf2551Th3Xn
 0hUm+gwHPtG3nsVP4qPV9jinTWbc9Aa7xzO5SAtF5H11T8Hg/oXPgYsEPZtGPj1rgMC9
 AsgOGU6ZFJH2iFe0ppmFlImIC80fWKBNyqYLM56T3L0Gs5Hn5RnVqZVLTlwvCaUelyl0
 8HA/lZEzcuJ8jJkW0nhvNPaSG/Woz7LhpEY3E+U49b9Le53imS+nOPZnBDKtbi5jobJ+
 7PAg==
X-Gm-Message-State: APjAAAVVKwtTVtASRhmICh/jefKaDMctrwO10DhvayJGFE+1mslCubTR
 DydMlSSK2lfPeUe6z0g/L88xKlgA
X-Google-Smtp-Source: APXvYqztugS8WM1tbqlEGerhrvcb8HU4ZcaOL9CRRdPtutEiPAI40i92aQBCeTI0RjWcIXAviTm0jw==
X-Received: by 2002:a05:6214:1306:: with SMTP id
 a6mr21209769qvv.38.1563225930136; 
 Mon, 15 Jul 2019 14:25:30 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 051/102] drm/amdkfd: Support MMHUB1 in kfd interrupt path
Date: Mon, 15 Jul 2019 16:23:46 -0500
Message-Id: <20190715212437.31793-49-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zLeC+0BT4SiSZKKtcLXd3N8rhGEhfNO/Zfhc+8FWBgc=;
 b=Q6gA2KK+faXLTT3630UukJ/uzG/+dwqAprrN0L2VzA1pM7bNsVs/v1lK36fAXz4G5X
 xFRTuSBkOWIqm6AlF/Knd+4uUbGbJvPaQrBzkC8t/yC9o6ss2LPQlBoauhVKGci+nNyC
 MBHjaRzp9xKLsk8fPLN/qWVTt5fVx0hv2KOVWp/rE/k9IbUsyjwHAn+4vaiafYaNrPv4
 Nry6fHIY75BX5A4jcGPFmlsUy5mbuO3tROta8HNp+dpgrTVw84yOsAPRs3I9MoUxeq5z
 MnRkuyVhJtlii4sq4R6TAarnG2F5zfe4uLiPSMIRC9HgxEmCK3udRQAue0o4DJFikadV
 8KUQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Yong Zhao <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6IFlvbmcg
WmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfaW50X3Byb2Nlc3NfdjkuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nl
c3NfdjkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pbnRfcHJvY2Vzc192OS5j
CmluZGV4IGE4NTkwNGFkMGQ1Zi4uM2VmNjdkMmUwZDlmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYwpAQCAtODAsNiArODAsNyBAQCBzdGF0
aWMgYm9vbCBldmVudF9pbnRlcnJ1cHRfaXNyX3Y5KHN0cnVjdCBrZmRfZGV2ICpkZXYsCiAJCXNv
dXJjZV9pZCA9PSBTT0MxNV9JTlRTUkNfU1FfSU5URVJSVVBUX01TRyB8fAogCQlzb3VyY2VfaWQg
PT0gU09DMTVfSU5UU1JDX0NQX0JBRF9PUENPREUgfHwKIAkJY2xpZW50X2lkID09IFNPQzE1X0lI
X0NMSUVOVElEX1ZNQyB8fAorCQljbGllbnRfaWQgPT0gU09DMTVfSUhfQ0xJRU5USURfVk1DMSB8
fAogCQljbGllbnRfaWQgPT0gU09DMTVfSUhfQ0xJRU5USURfVVRDTDI7CiB9CiAKQEAgLTEwNCw2
ICsxMDUsNyBAQCBzdGF0aWMgdm9pZCBldmVudF9pbnRlcnJ1cHRfd3Ffdjkoc3RydWN0IGtmZF9k
ZXYgKmRldiwKIAllbHNlIGlmIChzb3VyY2VfaWQgPT0gU09DMTVfSU5UU1JDX0NQX0JBRF9PUENP
REUpCiAJCWtmZF9zaWduYWxfaHdfZXhjZXB0aW9uX2V2ZW50KHBhc2lkKTsKIAllbHNlIGlmIChj
bGllbnRfaWQgPT0gU09DMTVfSUhfQ0xJRU5USURfVk1DIHx8CisJCWNsaWVudF9pZCA9PSBTT0Mx
NV9JSF9DTElFTlRJRF9WTUMxIHx8CiAJCSBjbGllbnRfaWQgPT0gU09DMTVfSUhfQ0xJRU5USURf
VVRDTDIpIHsKIAkJc3RydWN0IGtmZF92bV9mYXVsdF9pbmZvIGluZm8gPSB7MH07CiAJCXVpbnQx
Nl90IHJpbmdfaWQgPSBTT0MxNV9SSU5HX0lEX0ZST01fSUhfRU5UUlkoaWhfcmluZ19lbnRyeSk7
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

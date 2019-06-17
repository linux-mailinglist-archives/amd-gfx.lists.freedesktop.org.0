Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 845EA4900B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F226189EA9;
	Mon, 17 Jun 2019 19:46:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD0489E9E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:49 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d17so7338503qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JIuhIh6/27Kqt6rVSHhrZPFyMJcMFNSfKi8SYkl5Apg=;
 b=iTQHSwrPDosXmKUUjIw5toigPnbkznXjC5YqgiGYPfPK4hANNvZQhZWdm7RmUmXpLO
 tcyPtnBtaS+EyBiBg823R+UWYhBA1nJB6PLlOMOC58sNH3PMMLFWToUhZpQI8MnNJN3i
 0EQIPq1WhAHVG/bz3QeH6uawO2p5WEyquh60Ed3E4DfkOQCYasZDMJvbPFqqWNPOdVi1
 N/VFFuwLpERTaUJ/sjwKE+UxFWVPdEK/rvKS1kG3f1QlG7Ha3T9QrFsvLYRAdGlzxluS
 uLb914kuhTcDZFnojF1qMPxXiduKMePxbJZ+NZMlFvLvhLuiuF9lTpuM8DJbzObBV+Nj
 XW3w==
X-Gm-Message-State: APjAAAXlGjH3ZESyOUJd6eBLPEt2zNZskY8lczb18+qUXYaNoMQWwy+a
 cwc9WAJR0ztqT14CKtGdSZ4nkBqGIWQ2bA==
X-Google-Smtp-Source: APXvYqztIxW9vciZZdKHzCX9a8B2WmJQALVDINBDhcbg5AjFWaOZBIUeFkGwFpd0kK+eOvkTctxt+w==
X-Received: by 2002:ad4:43c1:: with SMTP id o1mr21863214qvs.226.1560800807043; 
 Mon, 17 Jun 2019 12:46:47 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:46 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 349/459] drm/amd/display: Move link functions from dc to
 dc_link
Date: Mon, 17 Jun 2019 14:44:50 -0500
Message-Id: <20190617194540.18497-50-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JIuhIh6/27Kqt6rVSHhrZPFyMJcMFNSfKi8SYkl5Apg=;
 b=ONGzU5pHZm/1MGMuv1RV7Rk/uttLlG2ED5zRiwPiTlI9IRYWswSFCbBKJKgwI4Q9sE
 3792AgbYvIfLChw39l984CjG7H+4zHgj9f+aBBGgKISyqOMbpO0EeGX1XH80wjjxOqq9
 +WvXhS+yuje72re6FRWICVH2uJfgvy7IxapsqRJsy9OaWOmH4C+KGE4XGmqf/NU15lNr
 oolkHC0EVXcgbHXheTbKtuYPARZKYKYU35oWZxySf7Qh9Y6ulz7mvsZUNOESBQHoGDiq
 sPI7Iw67kEdy+TlI77S4W8DDxW/W90b2syhfpibeM74HTxqBjOAE4dAxf4z0Hz6RT6W8
 mJOA==
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Chris Park <Chris.Park@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXMgUGFyayA8Q2hyaXMuUGFya0BhbWQuY29tPgoKW1doeV0KbGluay1zcGVjaWZp
YyBmdW5jdGlvbnMgc2hvdWxkIHJlc2lkZSBpbiBkY19saW5rLmMKCltIb3ddCk1vdmUgdGhlbSB0
aGVyZS4KClNpZ25lZC1vZmYtYnk6IENocmlzIFBhcmsgPENocmlzLlBhcmtAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IENoYXJsZW5lIExpdSA8Q2hhcmxlbmUuTGl1QGFtZC5jb20+CkFja2VkLWJ5OiBM
ZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjX2xpbmsuYyB8IDI3ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAyNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGNfbGluay5jCmluZGV4IDFhZjA2NjM3ZmRkYS4uMmE5ZjQ2NjE1NDBjIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCkBAIC0zMDUzLDYg
KzMwNTMsMzMgQEAgdWludDMyX3QgZGNfbGlua19iYW5kd2lkdGhfa2JwcygKIAlsaW5rX2J3X2ti
cHMgKj0gODsgICAvKiA4IGJpdHMgcGVyIGJ5dGUqLwogCWxpbmtfYndfa2JwcyAqPSBsaW5rX3Nl
dHRpbmctPmxhbmVfY291bnQ7CiAKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9S
VAorCWlmIChsaW5rLT5kcGNkX2NhcHMuZmVjX2NhcC5iaXRzLkZFQ19DQVBBQkxFKSB7CisJCS8q
IEFjY291bnQgZm9yIEZFQyBvdmVyaGVhZC4KKwkJICogV2UgaGF2ZSB0byBkbyBpdCBiYXNlZCBv
biBjYXBzLAorCQkgKiBhbmQgbm90IGJhc2VkIG9uIEZFQyBiZWluZyBzZXQgcmVhZHksCisJCSAq
IGJlY2F1c2UgRkVDIGlzIHNldCByZWFkeSB0b28gbGF0ZSBpbgorCQkgKiB0aGUgcHJvY2VzcyB0
byBjb3JyZWN0bHkgYmUgcGlja2VkIHVwCisJCSAqIGJ5IG1vZGUgZW51bWVyYXRpb24uCisJCSAq
CisJCSAqIFRoZXJlJ3MgZW5vdWdoIHplcm9zIGF0IHRoZSBlbmQgb2YgJ2ticHMnCisJCSAqIHRo
YXQgbWFrZSB0aGUgYmVsb3cgb3BlcmF0aW9uIDEwMCUgcHJlY2lzZQorCQkgKiBmb3Igb3VyIHB1
cnBvc2VzLgorCQkgKiAnbG9uZyBsb25nJyBtYWtlcyBpdCB3b3JrIGV2ZW4gZm9yIEhETUkgMi4x
CisJCSAqIG1heCBiYW5kd2lkdGggKGFuZCBtdWNoLCBtdWNoIGJpZ2dlciBiYW5kd2lkdGhzCisJ
CSAqIHRoYW4gdGhhdCwgYWN0dWFsbHkpLgorCQkgKgorCQkgKiBOT1RFOiBSZWR1Y2luZyBsaW5r
IEJXIGJ5IDMlIG1heSBub3QgYmUgcHJlY2lzZQorCQkgKiBiZWNhdXNlIGl0IG1heSBiZSBhIHN0
cmVhbSBCVCB0aGF0IGluY3JlYXNlcyBieSAzJSwgYW5kIHNvCisJCSAqIDEvMS4wMyA9IDAuOTcw
ODczIGZhY3RvciBzaG91bGQgaGF2ZSBiZWVuIHVzZWQgaW5zdGVhZCwKKwkJICogYnV0IHRoZSBk
aWZmZXJlbmNlIGlzIG1pbmltYWwgYW5kIGlzIGluIGEgc2FmZSBkaXJlY3Rpb24sCisJCSAqIHdo
aWNoIGFsbCB3b3JrcyB3ZWxsIGFyb3VuZCBwb3RlbnRpYWwgYW1iaWd1aXR5IG9mIERQIDEuNGEg
c3BlYy4KKwkJICovCisJCWxvbmcgbG9uZyBmZWNfbGlua19id19rYnBzID0gbGlua19id19rYnBz
ICogOTcwTEw7CisJCWxpbmtfYndfa2JwcyA9ICh1aW50MzJfdCkoZmVjX2xpbmtfYndfa2JwcyAv
IDEwMDBMTCk7CisJfQorI2VuZGlmCisKIAlyZXR1cm4gbGlua19id19rYnBzOwogCiB9Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

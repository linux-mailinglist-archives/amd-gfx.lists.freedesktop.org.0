Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4022A4715
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Nov 2020 14:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2566ECAD;
	Tue,  3 Nov 2020 13:58:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5519C6ECA9
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Nov 2020 13:58:41 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id 7so24270153ejm.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Nov 2020 05:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aFzh7d+BL+omZRqV5SRHSGrykMXk/y6EEcnePXjbTF8=;
 b=hkclbyjDDniYPLRMc1qSTr7eaHLEorqTC54J1hxJC57zgrT8wnfrTpauFuulOaBv6r
 lJWl6at9zqnRC1F16P/bRUwptYSp3IKP9ACuYpVZuBKQMAMXivk40gtD3lT677nvjMqt
 wK58ggrArBT515irUTJJLSx27qSeKtYw5v/eNUoDggXsr1qnXViHxWyu6PdEzEVD+S/5
 UbnKukf6EWfvfLNpYoHcbXoLl3K2OeGsUE5cDNO/z0450ziq24MXMz4SaxUs9rJbibE4
 Hz3sW+fLVZkOx+Kie5vBStpZKPcZ4ErkweLipavqzv1sIo6iB8VdAYoHWDTvZep/sJyJ
 B5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFzh7d+BL+omZRqV5SRHSGrykMXk/y6EEcnePXjbTF8=;
 b=QKABtiJXW6iv9Byr6fvwJ0ilYsZk2DJgyjSyR4U1o5byjfj1tfMhzKx3RItBa+10Bc
 Fkl/xXPdy6KXiKkugAhayQWtX77g7k2Zjn1TdGFgvF111D0Q4pVoEQQqFOHCKusmSH0k
 exY2hmu+P5GAqYkokWg+Oc2Ed6G2oXZb6h+6znklQkR2B3VlcXRP2aKV2dbrYG9TOW1p
 ScXc5iJwf76qxgLhrG4TvL3NKLmFHu/YbWwTPAiWfzyEm5EUYlDM1he5LBV/S00LqRIq
 FlPx5LoUCQ2/38AZ4Th9/Q6VTn3JHs5X6YJjS/2hKZURYy9zP37i8kqOMi2xrFKOMdUY
 L0wA==
X-Gm-Message-State: AOAM532Mj0fEeucihDlDBFSazfkNa0UyhJW8takTqNqF1f7Nw/paJA2n
 Ds4vAsgcYgy2E7VafyBKZT8Cy0izJAA=
X-Google-Smtp-Source: ABdhPJx2JNQxPXYUV7B0ltytU5zpUzq88avQfSWgNVVKSFza+dieun0Qk05eH9mUxhXi2HDZ/GrwDQ==
X-Received: by 2002:a17:906:3ed0:: with SMTP id
 d16mr20964259ejj.477.1604411919742; 
 Tue, 03 Nov 2020 05:58:39 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f3a2:b920:33f3:da11])
 by smtp.gmail.com with ESMTPSA id j6sm7903263edy.87.2020.11.03.05.58.39
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:58:39 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/8] drm/amdgpu: drop leading zeros from the gmc9 fault address
Date: Tue,  3 Nov 2020 14:58:31 +0100
Message-Id: <20201103135837.39693-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103135837.39693-1-christian.koenig@amd.com>
References: <20201103135837.39693-1-christian.koenig@amd.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGFkZHJlc3Mgc3BhY2UgaXMgb25seSA0OGJpdCwgbm90IDY0Yml0LiBBbmQgdGhlIFZNSFVC
cyB3b3JrIHdpdGgKc2lnbiBleHRlbmRlZCBhZGRyZXNzZXMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5j
CmluZGV4IDBjMzQyMWQ1ODdlOC4uZTg2ZWYwYzM2NTk2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192OV8wLmMKQEAgLTU1Nyw3ICs1NTcsNyBAQCBzdGF0aWMgaW50IGdtY192OV8wX3By
b2Nlc3NfaW50ZXJydXB0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQllbnRyeS0+c3Jj
X2lkLCBlbnRyeS0+cmluZ19pZCwgZW50cnktPnZtaWQsCiAJCWVudHJ5LT5wYXNpZCwgdGFza19p
bmZvLnByb2Nlc3NfbmFtZSwgdGFza19pbmZvLnRnaWQsCiAJCXRhc2tfaW5mby50YXNrX25hbWUs
IHRhc2tfaW5mby5waWQpOwotCWRldl9lcnIoYWRldi0+ZGV2LCAiICBpbiBwYWdlIHN0YXJ0aW5n
IGF0IGFkZHJlc3MgMHglMDE2bGx4IGZyb20gY2xpZW50ICVkXG4iLAorCWRldl9lcnIoYWRldi0+
ZGV2LCAiICBpbiBwYWdlIHN0YXJ0aW5nIGF0IGFkZHJlc3MgMHglMDEybGx4IGZyb20gY2xpZW50
ICVkXG4iLAogCQlhZGRyLCBlbnRyeS0+Y2xpZW50X2lkKTsKIAogCWlmIChhbWRncHVfc3Jpb3Zf
dmYoYWRldikpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeAo=

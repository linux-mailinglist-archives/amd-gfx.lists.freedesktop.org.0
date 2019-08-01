Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BD87E43A
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A526E7E5;
	Thu,  1 Aug 2019 20:30:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DCC6E7E5
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:36 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id w190so53095065qkc.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7AlGgimuzwjFAy2q3z6Tj9r9bNzqhWdw7aS+ONrHuso=;
 b=Szmiil03E6HHUc/SyW/wGXkkOlLgbzdsrQAJuZTiq0N7tU+nAaCEYSPwePb3O9Bt8A
 E4qF7jA7iKe8xwh7kkhemu+/5BwDyYTcoGQcUtFiucZFpkR5Iv+srE4nkvkDInSsqi2i
 c57MQwXDXX81J8xeNrJuNq5cdB8fhvv+HLT7Apa4NCLW4/bClK/qy8NA2YqtoDrMBxCf
 0/xdPAyFB8qeZ+wYojUKdZofb2D34PKFrJlTbmwMPwDwNk6qaOENh6FCTWSA/V1yIPM2
 Aj8aSDb11OaHrb+QL5qdwRMFEOOoGbCd0aA6VXXbC4p1gMJ0UOOvfm3WjO9dKD/HChR6
 sbAw==
X-Gm-Message-State: APjAAAWjf44EhzaIPqnqIzm7oj7bA/wuoc9OIRCflxIcJVClu7IZaorS
 YWiRHWwpxfs/pZwb4x6ICpey9xM8
X-Google-Smtp-Source: APXvYqyeiXNfEQ107eyu5Daki//tBNnP/88IZsAFE/yMhObawAepkzr3WtGXc3pa3Za0IagRt1LV2A==
X-Received: by 2002:a37:97c5:: with SMTP id z188mr92126796qkd.5.1564691434844; 
 Thu, 01 Aug 2019 13:30:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 33/36] drm/amd/display: Add ASICREV_IS_NAVI macros
Date: Thu,  1 Aug 2019 15:29:54 -0500
Message-Id: <20190801202957.29791-34-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7AlGgimuzwjFAy2q3z6Tj9r9bNzqhWdw7aS+ONrHuso=;
 b=l8yc8CDrxX+4lI+wFnLCZiQ8YhwZmLwrokKSXVoZ5rGvGOt3YiIU5OFsC6JeXzUJvq
 AZTWpa86hEKVBpALap0Te0hwRGTTe7uWkTpmI7UxLzi/PSRNiqKCPdBclMceQk1v2otz
 u9o/YP6AeDh5EcKXZCIAw8BXUpwhVUEX+kg1u6NWD0uSMHnqNShq14xATveeGkKbe774
 udthQkAEYVcexAVy9oGhomwxn9tnaqhpnBhNEbBiJT4lBqEmJbDUWwQZrxch3TTSkos5
 7MvEOMK9jY2ghpq/vY2iAaLY6ldAZD3t7xoFLp1UPyb5U0Q6eatED85IVmU14Nfseq/O
 WAOA==
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
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Roman Li <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpUaGV5IGFyZSB1c2VkIGJ5IERDIHRv
IGRldGVybWluZSBBU0lDIHJldnMuCgpTaWduZWQtb2ZmLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFJvbWFuIExpIDxSb21hbi5MaUBhbWQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGFsX2FzaWNfaWQuaCB8IDQgKysrLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RhbF9hc2ljX2lkLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9kYWxfYXNpY19pZC5oCmluZGV4IDk0
YjdkNWVjMTU1Yi4uZDJlMzgwZDhjOWEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvaW5jbHVkZS9kYWxfYXNpY19pZC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9pbmNsdWRlL2RhbF9hc2ljX2lkLmgKQEAgLTE1MywxMSArMTUzLDEzIEBACiAKIGVu
dW0gewogCU5WX05BVkkxMF9QX0EwICAgICAgPSAxLAorCU5WX05BVkkxMl9QX0EwICAgICAgPSAx
MCwKIAlOVl9OQVZJMTRfTV9BMCAgICAgID0gMjAsCiAJTlZfVU5LTk9XTiAgICAgICAgICA9IDB4
RkYKIH07CiAKLSNkZWZpbmUgQVNJQ1JFVl9JU19OQVZJMTBfUChlQ2hpcFJldikgICAgICAgIChl
Q2hpcFJldiA8IE5WX05BVkkxNF9NX0EwKQorI2RlZmluZSBBU0lDUkVWX0lTX05BVkkxMF9QKGVD
aGlwUmV2KSAgICAgICAgKGVDaGlwUmV2IDwgTlZfTkFWSTEyX1BfQTApCisjZGVmaW5lIEFTSUNS
RVZfSVNfTkFWSTEyX1AoZUNoaXBSZXYpICAgICAgICAoKGVDaGlwUmV2ID49IE5WX05BVkkxMl9Q
X0EwKSAmJiAoZUNoaXBSZXYgPCBOVl9OQVZJMTRfTV9BMCkpCiAjZGVmaW5lIEFTSUNSRVZfSVNf
TkFWSTE0X00oZUNoaXBSZXYpICAgICAgICAoKGVDaGlwUmV2ID49IE5WX05BVkkxNF9NX0EwKSAm
JiAoZUNoaXBSZXYgPCBOVl9VTktOT1dOKSkKICNlbmRpZgogCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

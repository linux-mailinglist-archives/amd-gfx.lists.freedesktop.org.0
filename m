Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D596FD2DAD
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 17:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE3B6E37C;
	Thu, 10 Oct 2019 15:26:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF14D6EB73
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 15:26:37 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id w2so5996126qkf.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 08:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v9Q6qAui+G2tkXe6dp1JqBsWcbzY0Mtxwp15LGoaczs=;
 b=bA9t7KGR/6fmiJqDgsXQc9qe9u6AECCe4BX75vsJSeb55jRLKszy+x2439YmEebth8
 WAaskyNMg2+UrlLbUJ1PitmW0JjxGxZcqRxzTnJ0DiaTKPUWy3WcX4qy0rGkoa5FvDKq
 8kdUSTmbDDS1k9lCeBtTxiPoJneREL3DjNXkhUtbnlHADcLdOHA47leYyJlnj/DYoKBL
 HLivOMoUZtkxtwX+IePqaCJYnGg0xZ8+WbWyHFgumnQzZSNQdbhzy53/jTIE+83SshUa
 v2s+1ILk8K4dhI7LnImFMqfgoFJefHBP/elnbj2dlimP5BD251hDws8+a4icHU35WwEm
 DCZQ==
X-Gm-Message-State: APjAAAW4/TFLiV3Swe0Bg0s8gz7MauylT6W/z2bQYUm5RGFmoay+F+WB
 Xkm5cckd/lWKKYrQWkBoZXW+sO0M
X-Google-Smtp-Source: APXvYqw8D07TSFb8StXEY4z44iBhVCruyIR6K7Zdxr/IJpTH+3qo4QuNG5pUf8kUHrtY0EbGnGeAkg==
X-Received: by 2002:a05:620a:1355:: with SMTP id
 c21mr10522777qkl.288.1570721196541; 
 Thu, 10 Oct 2019 08:26:36 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id w45sm3389610qtb.47.2019.10.10.08.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 08:26:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/amdgpu: simplify ATPX detection
Date: Thu, 10 Oct 2019 10:26:17 -0500
Message-Id: <20191010152619.31011-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191010152619.31011-1-alexander.deucher@amd.com>
References: <20191010152619.31011-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v9Q6qAui+G2tkXe6dp1JqBsWcbzY0Mtxwp15LGoaczs=;
 b=YXIf4P5M8BfPmrOp6jj0vNZw+L7KTh25sV8W6Cs9FdQx0jmBb+mq5O7YfgGjIHbXqd
 E9tyx6GBUcdzcmmKQCPr5729NIrBV4Mi5Kt+ap2TFbkOyGaqzhqSttXcPLojoaObST0b
 wpwxNtwomjYUNjG88cJcRa133Jzit3UfoMEbwid5XMuxouXEpoSlGQh6qXuPcMFtsI08
 D60CqGKPXLYUom6II2+6k5/KQbyY0AMoWdIhJrBMVYTINlHRehvJv94LAuXm++9q7J3Y
 96VGiM5nKRPqYVjfZm42ebREgFHl26qdOUXsG5RJz5wl+iF3C4QG54KjE6TZsF+vEXbz
 X5Yw==
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

VXNlIHRoZSBiYXNlIGNsYXNzIHJhdGhlciB0aGFuIHRoZSBzcGVjaWZpYyBjbGFzcyBhbmQgZHJv
cAp0aGUgc2Vjb25kIGxvb3AuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2F0cHhfaGFuZGxlci5jIHwgMTIgKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hdHB4X2hhbmRsZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hdHB4X2hhbmRsZXIuYwppbmRleCAzZTM1YThmMmM1ZTUuLmE5N2ZiNzU5ZTJm
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2F0cHhfaGFu
ZGxlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdHB4X2hhbmRs
ZXIuYwpAQCAtNjEzLDE3ICs2MTMsNyBAQCBzdGF0aWMgYm9vbCBhbWRncHVfYXRweF9kZXRlY3Qo
dm9pZCkKIAlib29sIGQzX3N1cHBvcnRlZCA9IGZhbHNlOwogCXN0cnVjdCBwY2lfZGV2ICpwYXJl
bnRfcGRldjsKIAotCXdoaWxlICgocGRldiA9IHBjaV9nZXRfY2xhc3MoUENJX0NMQVNTX0RJU1BM
QVlfVkdBIDw8IDgsIHBkZXYpKSAhPSBOVUxMKSB7Ci0JCXZnYV9jb3VudCsrOwotCi0JCWhhc19h
dHB4IHw9IChhbWRncHVfYXRweF9wY2lfcHJvYmVfaGFuZGxlKHBkZXYpID09IHRydWUpOwotCi0J
CXBhcmVudF9wZGV2ID0gcGNpX3Vwc3RyZWFtX2JyaWRnZShwZGV2KTsKLQkJZDNfc3VwcG9ydGVk
IHw9IHBhcmVudF9wZGV2ICYmIHBhcmVudF9wZGV2LT5icmlkZ2VfZDM7Ci0JCWFtZGdwdV9hdHB4
X2dldF9xdWlya3MocGRldik7Ci0JfQotCi0Jd2hpbGUgKChwZGV2ID0gcGNpX2dldF9jbGFzcyhQ
Q0lfQ0xBU1NfRElTUExBWV9PVEhFUiA8PCA4LCBwZGV2KSkgIT0gTlVMTCkgeworCXdoaWxlICgo
cGRldiA9IHBjaV9nZXRfY2xhc3MoUENJX0JBU0VfQ0xBU1NfRElTUExBWSA8PCAxNiwgcGRldikp
ICE9IE5VTEwpIHsKIAkJdmdhX2NvdW50Kys7CiAKIAkJaGFzX2F0cHggfD0gKGFtZGdwdV9hdHB4
X3BjaV9wcm9iZV9oYW5kbGUocGRldikgPT0gdHJ1ZSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42ED48DE1
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCE889308;
	Mon, 17 Jun 2019 19:17:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C5A8930F
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:35 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d17so7217368qtj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DUfB+O4KW0Ddhp84KzOocpnBkvPmvzgVHChZhECyauQ=;
 b=Q2f7G0k57kooFGfrEd7CNybROupI2Vwfl6c6N1Aa57J/GmxfGGI/qB7yKXd9le0lQB
 Ublhl9lLN3JMpyH0gbgMs+ez/sC/YPeAVmpn5p9FDRNQVfVLJmk346Jq6J8y+HDyA3+P
 K2qaG06pwAj+lK+tAqgjGk9njN6nkdo8O8UcN5VszxQ1MTlKK3ldCd+NTpphfHEbBcbe
 /HxqhGi/sU7Z/q4CqrVMx43Ph0aG5jRu1v8msenmTEJXrKRc/fdpK4dUTa73KFcaSgVp
 /uwntbWq2qqx3EBSLCs+cORrl7+qV36Noc3ldK3SODBHRQxRr5RhIAzfB0dmv5VDxKNS
 +FAQ==
X-Gm-Message-State: APjAAAXPOxyXUFNaMLGGFaWNQ+A4IIgpKJtkX7VbAdiomC+WiN8KQL5n
 aKG2zZ0ozpzzpWah7Q3CcaUYQMFEwuo=
X-Google-Smtp-Source: APXvYqyU6QFOHFc+IsELMAgJx3lABKFq1bG9KEdPWyICxKWTb1Km79rg5pQeseRqwkREYiPYduQimQ==
X-Received: by 2002:a0c:d0b6:: with SMTP id z51mr23337904qvg.3.1560799054613; 
 Mon, 17 Jun 2019 12:17:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 031/459] drm/amdgpu: add nbio callbacks for vcn doorbell
 support
Date: Mon, 17 Jun 2019 14:09:52 -0500
Message-Id: <20190617191700.17899-20-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DUfB+O4KW0Ddhp84KzOocpnBkvPmvzgVHChZhECyauQ=;
 b=dh6O4dBfvqkzKY0rKx/VTfZ3eOyV4v+q58iCccl8eJojb4HvJD7YHygxsaYIqN05TQ
 jrHl/avRHB1oCAicq/3bhOayM+z6l568grjdhCjXn5Iqz+UOQdsOhuoW1C0C3O8YtzEX
 j0rY0cqDoWjjpuGCDpIybXdF8khbK21UtXCMFUyoFAW/7ggpj5H3oaQxuE8wkHLoEI9m
 W93R3uxyuz0iDfQ/BlRmZGAld0JGKf+vZAsd5z8lDRmx9WETARBYmIeU0elfxwGkMOeg
 bwrdApp+a9jmqyAF8xoUm29pBGlGwqxNNz7hUtnM2HLg8ucJoz1ithIwNqsFcMZAld6a
 7VDA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKRm9yIE5hdmkxMCBWQ04yLjAsIHRoZSBl
bmdpbmUgc3VwcG9ydHMgRG9vcmJlbGwKClNpZ25lZC1vZmYtYnk6IExlbyBMaXUgPGxlby5saXVA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
LmgKaW5kZXggNzVmN2ZmYjVhMWIwLi5hNGY2NjhkOTFjNDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oCkBAIC02NjIsNiArNjYyLDggQEAgc3RydWN0IGFtZGdwdV9uYmlvX2Z1bmNz
IHsKIAl1MzIgKCpnZXRfbWVtc2l6ZSkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogCXZv
aWQgKCpzZG1hX2Rvb3JiZWxsX3JhbmdlKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50
IGluc3RhbmNlLAogCQkJYm9vbCB1c2VfZG9vcmJlbGwsIGludCBkb29yYmVsbF9pbmRleCwgaW50
IGRvb3JiZWxsX3NpemUpOworCXZvaWQgKCp2Y25fZG9vcmJlbGxfcmFuZ2UpKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCBib29sIHVzZV9kb29yYmVsbCwKKwkJCWludCBkb29yYmVsbF9pbmRl
eCk7CiAJdm9pZCAoKmVuYWJsZV9kb29yYmVsbF9hcGVydHVyZSkoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsCiAJCQkJCSBib29sIGVuYWJsZSk7CiAJdm9pZCAoKmVuYWJsZV9kb29yYmVsbF9z
ZWxmcmluZ19hcGVydHVyZSkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

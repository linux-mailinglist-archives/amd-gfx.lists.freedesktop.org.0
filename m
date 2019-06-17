Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EF349022
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2022B89F92;
	Mon, 17 Jun 2019 19:47:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EB089F73
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:06 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h21so12249534qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNm/qBmbfe83MazKX7cnTiuM1o63bhd8vNLB+rjlxKU=;
 b=C93fUix45tjvD4hrFgC69UMuB/SH5P94ZIbx2Oh5cF88gL/FR3pxx4AMWXtnSHuNPO
 rV5+vUt1uQcDnR98TriKrHUOFvOy9ewVaEXWgCqmi1C9jPnfIaXY7aK3jhgGY+DNuYAL
 a4xYfh7F56L92zb0rcTUgTMs7ro80v3FGinhiCQgmca4uNvJIEXHZHDOSQf84lyzPf9H
 9sBL1+uQ/GDtgmPbak4oa5WwJxpUGxRzixarA2GbYrsRG6O09WPgRGTAxHpm0CtZf6ph
 hGXIeFhT/o7clqrulKLBlBTbV6uLi+WpRhAjNzJBfKxKXPItttQNDvT4OhQMlejPDk2V
 crQw==
X-Gm-Message-State: APjAAAUCHKr3Rwwqd/1K5m6PjvUJyHEi7rjkar4cQ23hh00KQedas3Hn
 q5h2hqk+UR6yCAohlwyZLGcxqxO1R+mxdw==
X-Google-Smtp-Source: APXvYqwSthsYJNzLMndqvpVncLI94Bgb59lL5b+Q4QQssJXeVkqM1jfVKX9/mlSP6pLSm1rpjRKiWQ==
X-Received: by 2002:ac8:2f96:: with SMTP id l22mr47323148qta.188.1560800823877; 
 Mon, 17 Jun 2019 12:47:03 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 367/459] drm/amd/display: Properly set DCF clock
Date: Mon, 17 Jun 2019 14:45:08 -0500
Message-Id: <20190617194540.18497-68-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNm/qBmbfe83MazKX7cnTiuM1o63bhd8vNLB+rjlxKU=;
 b=A6X5+JkWF1FGjVUsPIeUuJuzmzdQeQ26XPS1KkZgFzCHgg29jezT9HhpsB1RyiSAUf
 mbDtZep8J5SfvafLPONJqgGuqe+78h+IUgNGrok+tksqbR4i/b3ZJ8eX3GDvcMYTFl2Q
 rN3n+qs9vDTPml6zrYF8HvZqFzAuBbFW6Yx97DvQeX16UPl1iEx+V4+apSUSqdkcJgoy
 ZdVa3vXF2pZDuMZkZJYb6x0KUOab4YzvHphfQfgvVuT0Kq99k6ys/yLpe4GJxEaXJito
 sphu/8TIegkz10nLnRAMJXYmL32m21SFxQNvlJkKHlUqxGuciCJe4+SEqja23WLAULPF
 UPyw==
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
Cc: Leo Li <sunpeng.li@amd.com>, Aidan Wood <Aidan.Wood@amd.com>,
 Aric Cyr <Aric.Cyr@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWlkYW4gV29vZCA8QWlkYW4uV29vZEBhbWQuY29tPgoKW1doeV0KSWYgbnVtX3N0YXRl
cyA9PSAwIHdlIGRpZCB1cGRhdGVfYm91bmRfYm94IHdoaWNoIGRvZXNuJ3QgdXBkYXRlZCBhbnkg
bWF4CmNsb2NrcyBpZiBudW1fc3RhdGVzID09IDAsIHRoZXJlZm9yZSB3ZSBuZWVkIHRvIGRvIGNh
cF9zb2NfY2xvY2tzCmluc3RlYWQsIGFsc28gU01VIGNhbm5vdCBzZXQgRENGIGNsb2NrIHRvIGEg
aGlnaGVyIHRoYW4gb3IgZXF1YWwgdG8gZnJlcQp0aGFuIFNPQyBjbG9jawoKW0hvd10KQWRkIGEg
bnVtX3N0YXRlcyAhPSAwIGNoZWNrIGZvciB1cGRhdGVfYm91bmRpbmdfYm94IHRvIGJlIHJ1biwg
YW5kIGFmdGVyCndlIHJ1biBnZXRfbWF4aW11bV9zdXN0YWluYWJsZV9jbG9ja3Mgd2Ugbm93IGNo
ZWNrIGlmIHRoZSByZXBvcnRlZCBtYXgKdmFsdWUgb2YgRENGIGlzIGhpZ2hlciB0aGFuIFNPQyBh
bmQgaWYgbmVjZXNzYXJ5IHNldCBpdCB0byAxMDAwCihiZWNvbWVzIDEgYWZ0ZXIgZGl2aXNpb24g
YnkgMTAwMCkgbG93ZXIgdGhhbiBTT0MKClNpZ25lZC1vZmYtYnk6IEFpZGFuIFdvb2QgPEFpZGFu
Lldvb2RAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQuY29tPgpB
Y2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8IDcgKysrKystLQogMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCmluZGV4
IDQ5MTE0ZDgyMzI0MC4uNmJjNGIzZjMzMDFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpAQCAtMjYxMSwxMSArMjYx
MSwxNCBAQCBzdGF0aWMgYm9vbCBpbml0X3NvY19ib3VuZGluZ19ib3goc3RydWN0IGRjICpkYywK
IAkJaWYgKHBvb2wtPmJhc2UucHBfc211LT5udl9mdW5jcy5nZXRfbWF4aW11bV9zdXN0YWluYWJs
ZV9jbG9ja3MpIHsKIAkJCXN0YXR1cyA9ICgqcG9vbC0+YmFzZS5wcF9zbXUtPm52X2Z1bmNzLmdl
dF9tYXhpbXVtX3N1c3RhaW5hYmxlX2Nsb2NrcykKIAkJCQkJKCZwb29sLT5iYXNlLnBwX3NtdS0+
bnZfZnVuY3MucHBfc211LCAmbWF4X2Nsb2Nrcyk7Ci0KKwkJCS8qIFNNVSBjYW5ub3Qgc2V0IERD
RiBjbG9jayB0byBhbnl0aGluZyBlcXVhbCB0byBvciBoaWdoZXIgdGhhbiBTT0MgY2xvY2sKKwkJ
CSAqLworCQkJaWYgKG1heF9jbG9ja3MuZGNmQ2xvY2tJbktoeiA+PSBtYXhfY2xvY2tzLnNvY0Ns
b2NrSW5LaHopCisJCQkJbWF4X2Nsb2Nrcy5kY2ZDbG9ja0luS2h6ID0gbWF4X2Nsb2Nrcy5zb2ND
bG9ja0luS2h6IC0gMTAwMDsKIAkJCWNsb2NrX2xpbWl0c19hdmFpbGFibGUgPSAoc3RhdHVzID09
IFBQX1NNVV9SRVNVTFRfT0spOwogCQl9CiAKLQkJaWYgKGNsb2NrX2xpbWl0c19hdmFpbGFibGUg
JiYgdWNsa19zdGF0ZXNfYXZhaWxhYmxlKQorCQlpZiAoY2xvY2tfbGltaXRzX2F2YWlsYWJsZSAm
JiB1Y2xrX3N0YXRlc19hdmFpbGFibGUgJiYgbnVtX3N0YXRlcykKIAkJCXVwZGF0ZV9ib3VuZGlu
Z19ib3goZGMsICZkY24yXzBfc29jLCAmbWF4X2Nsb2NrcywgdWNsa19zdGF0ZXMsIG51bV9zdGF0
ZXMpOwogCQllbHNlIGlmIChjbG9ja19saW1pdHNfYXZhaWxhYmxlKQogCQkJY2FwX3NvY19jbG9j
a3MoJmRjbjJfMF9zb2MsIG1heF9jbG9ja3MpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

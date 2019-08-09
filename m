Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C6887EA3
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7FD6EE50;
	Fri,  9 Aug 2019 15:53:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648F76EE4A
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:30 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id k10so27115790qtq.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1rbOlpHn/399vkUW0TOvc2J/Nd3k+jZCBDgIDX/WyWQ=;
 b=iyJMIf1RAzLzOJcWEU7CcS9ZfUuiiN7JkSNWeAcaUWw77FWNst2dz5PZ8+bF850hBM
 UIHXlVCoLoUGcL2gkgigUg6j8TWActyu6kdq9z1GJrSR5O8YFr9oqokCQFUt7EhFs0vE
 wDA1BqUp09QzgsDnOX/2yjjPOGS9sCoyUzdxzCCkfQy7PQeQvsR6dX431QctIex5kuAY
 genii7Rq6YaRE7js2o7ee3mYqOgv7LHawJt67wgUOBUP8D7kSyocXQ9k4DPDpKgljhbb
 5dhmeIi+sjS65naMbmjb2QXdmT1XSBOeShzqVWzzN39MeCXanXq5eaAHm0YmY1DLq3cR
 NVGA==
X-Gm-Message-State: APjAAAXNKM5ZYrdbDtks9VDsu31BtKhJfKgRRiznfLgl05LDH+xLs2pT
 oMw3U0bW4f/4px0vECBEcQXLiURM
X-Google-Smtp-Source: APXvYqxsbONEKtPR76wxaemv1kxSNztIMBO2gEhgDkIQvfo4uxSJe2hpPXL7MHEm3YkEULK93wyUCg==
X-Received: by 2002:a0c:afac:: with SMTP id s41mr18594313qvc.184.1565366008677; 
 Fri, 09 Aug 2019 08:53:28 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 21/27] drm/amdgpu: enable clock gating for renoir
Date: Fri,  9 Aug 2019 10:52:56 -0500
Message-Id: <20190809155302.4733-21-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1rbOlpHn/399vkUW0TOvc2J/Nd3k+jZCBDgIDX/WyWQ=;
 b=WTuf0afbumUT2BHVjeLqFmW4hW5QpOjGOj+NTfO7rj1zH68C3EBCKRMIL+hesCHzlM
 gX1AZluAsYyZB1zbMVOcm16SHQMYj0QbKReQysVKMQo+zt2dXFQpaaMCe6D8BEUzl5hq
 NP5W3rH7GRJM+W8GgMo/dUiXnOiYbfeu9kJ5GGDpUzIrEFlX/2yTbL1wzvlwDGfc26oU
 aNpVJq1MaZb4avqS2sSKizHhOtyNF5gYEt3ELJiIl/HUL56rHagodMUpkQ5IR9mxlkv7
 2k6tYxB5kUD2MHysEba8WcxQY3n1ndx0rZc6G3RcB9gkUICk4/uu4P1eHlc8tgy+zM9M
 uksA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Aaron Liu <aaron.liu@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KCmVuYWJsZSBnZngmY29tbW9uIGNs
b2NrIGdhdGluZyBmb3IgcmVub2lyCgpTaWduZWQtb2ZmLWJ5OiBBYXJvbiBMaXUgPGFhcm9uLmxp
dUBhbWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zb2MxNS5jICAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IGNhYmE5ZjAzOGIzOC4uMjRiODI5
ODJjMzI0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTQ4NDksNiAr
NDg0OSw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfc2V0X2Nsb2NrZ2F0aW5nX3N0YXRlKHZvaWQg
KmhhbmRsZSwKIAljYXNlIENISVBfVkVHQTEyOgogCWNhc2UgQ0hJUF9WRUdBMjA6CiAJY2FzZSBD
SElQX1JBVkVOOgorCWNhc2UgQ0hJUF9SRU5PSVI6CiAJCWdmeF92OV8wX3VwZGF0ZV9nZnhfY2xv
Y2tfZ2F0aW5nKGFkZXYsCiAJCQkJCQkgc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVl
IDogZmFsc2UpOwogCQlicmVhazsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDU0
NDZhODJkMmU4YS4uOWY4MmE4M2M3NDc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMK
QEAgLTEzOTQsNiArMTM5NCw3IEBAIHN0YXRpYyBpbnQgc29jMTVfY29tbW9uX3NldF9jbG9ja2dh
dGluZ19zdGF0ZSh2b2lkICpoYW5kbGUsCiAJCQkJc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUg
PyB0cnVlIDogZmFsc2UpOwogCQlicmVhazsKIAljYXNlIENISVBfUkFWRU46CisJY2FzZSBDSElQ
X1JFTk9JUjoKIAkJYWRldi0+bmJpb19mdW5jcy0+dXBkYXRlX21lZGl1bV9ncmFpbl9jbG9ja19n
YXRpbmcoYWRldiwKIAkJCQlzdGF0ZSA9PSBBTURfQ0dfU1RBVEVfR0FURSA/IHRydWUgOiBmYWxz
ZSk7CiAJCWFkZXYtPm5iaW9fZnVuY3MtPnVwZGF0ZV9tZWRpdW1fZ3JhaW5fbGlnaHRfc2xlZXAo
YWRldiwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

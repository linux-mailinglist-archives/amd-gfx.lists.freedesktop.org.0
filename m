Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7BD7E41D
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE876E7C6;
	Thu,  1 Aug 2019 20:30:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3ED6E7C0
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:11 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id h21so71620056qtn.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=48Bjx+o6oRmvyuuAPZaO7dtvOBBy9oGndsS1WdmfqXE=;
 b=OeP21JglPq8DlpCxwcapaGjF7RktvZym7O8yAFXtj9/2pYMK7NHrSUiJtEif9Nvrla
 NBNBUK8R1F3GnOT5ojdQaJfJUHp/laVAiO5b273TQkxmU9WFEmEL9At17zlEY3/CGJfn
 qtS5dbVmHnk9hya7VTPsXo1AMgXnDHoVpBG7+PFibKY4mqdRIhR8/Hlr8yrPKTtHjO6k
 Mu1bOT8HeBnPw9C6+0WKKp9CX8rXUJExwvKwBoj1E7iNC+jjlx3BsHHWx40jPPAMQAyP
 wQxh3INxijKAUhagUYk4PJ+dFECA0S60LfTwese/nddjmVHOXI30TBiAS2y0VAKygK+R
 mZqA==
X-Gm-Message-State: APjAAAXbkqjWpb7UhRpcQ7Gv9sLhxKq0NlYqi1FWOZrCvd1RWlyDEsio
 rfkxSLDDbFAryhI07mIvsjVFcOEm
X-Google-Smtp-Source: APXvYqxY5ssh6ZjZ05a3xXvqAd+N7S51Sj1OQCgKQNIrd3WtdiHv3H0xq37yIoZbdZ5pW1oYLh4wsg==
X-Received: by 2002:ac8:41d1:: with SMTP id o17mr65012506qtm.17.1564691410140; 
 Thu, 01 Aug 2019 13:30:10 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:09 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 05/36] drm/amdgpu: set asic family and ip blocks for navi12
Date: Thu,  1 Aug 2019 15:29:26 -0500
Message-Id: <20190801202957.29791-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=48Bjx+o6oRmvyuuAPZaO7dtvOBBy9oGndsS1WdmfqXE=;
 b=Q0VXn3b+9+FCdTdlIPdKpwPVLQ7v/x1XTr/B02OMAwt2tUIDwCMDY90sUInKgM1P0e
 xxoQ9gubGCa4TMtLxwM+1wr7OEqVkjDxf+ongUoWc5fA40Y6za7Q/i3ocuqVELCd3cB0
 51FOxg7kMCvQKGNur0JoV4PsLt6S0HbkzR5hYzx5H42AhEbh5+M7FjmaxWow5gQeqRCV
 q6F9MbdIQWVJDqU95viN7GM/sWXJM9rHyzaXeWg9U+0j0eDeBdRNsEOiXVyvhgbmXyuX
 O0oOISwGwUAna1GZN3EOFdYV2+TNNRPApxqN6dSJBtykq91h248L4wGZqSkthuLkWoF9
 b8wg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCnNhbWUgd2l0aCBuYXZp
MTAKClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYwppbmRleCAzN2JiNDIxODk5ZjMuLjQ1MTA1NmZkMWU3MSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMTYyNiw2ICsxNjI2LDcgQEAgc3Rh
dGljIGludCBhbWRncHVfZGV2aWNlX2lwX2Vhcmx5X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpCiAJCWJyZWFrOwogCWNhc2UgIENISVBfTkFWSTEwOgogCWNhc2UgIENISVBfTkFWSTE0
OgorCWNhc2UgIENISVBfTkFWSTEyOgogCQlhZGV2LT5mYW1pbHkgPSBBTURHUFVfRkFNSUxZX05W
OwogCiAJCXIgPSBudl9zZXRfaXBfYmxvY2tzKGFkZXYpOwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=

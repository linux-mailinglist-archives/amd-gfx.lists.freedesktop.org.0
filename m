Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB8B6D209
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 18:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB836E443;
	Thu, 18 Jul 2019 16:33:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA206E3AE
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 12:59:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f9so28560119wre.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 05:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xzSmfnXRcQ0lncJ4oY1al5Tz1krJ5LsMFDXPD4J+9Yg=;
 b=Fljg8hcuZHb5Y+lFOct0nH3BLEBIf5YjEL65gj9+yESpK8b0gAt33ubpAQGl3gvbHf
 GHbG0ng949eFDvM3S4SPHkZets3q4nPJrICJLtuTw7e6gNUcjf8fDPpsqFaUeSKJy+rX
 UmJRy4yVZcsaL+c4qkdvqDkN7YTVM1GaNog7G3hpXJahpkdQTuva5w3TC+uqlHXmfLI+
 ge+P7FR4OZlOXjJRc1bpCn+sxIjmVIXw1NJ56MnjWNjX5grGD4HBt6CiB9XLRvvgOaeI
 j6LlSIho9hgECzP0e5bQkOkdGxPPUntljkTiD2GjsWtR2MceOIqEaDHUeLe5C4m8qBuP
 lviQ==
X-Gm-Message-State: APjAAAXg9+NWjE9q7w+2OoxYEoegEoN8Ba8c9Z3aQuqfwgQxvGqpQwx3
 PnUogTsSFdT6lhaLUaKisxEsKzXzvxBTiBCa84nE
X-Google-Smtp-Source: APXvYqx+UA6wGMTsSYyKydsHPsreGPcADwb0A3zKt9W4oWZfUbYMFYDh4XnvSlOSEREuZ5JLmfQ4N7152jaQCWuJoHM=
X-Received: by 2002:adf:a344:: with SMTP id d4mr49759564wrb.237.1563454745883; 
 Thu, 18 Jul 2019 05:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190718020745.8867-1-fred@fredlawl.com>
 <20190718020745.8867-2-fred@fredlawl.com>
In-Reply-To: <20190718020745.8867-2-fred@fredlawl.com>
From: Bjorn Helgaas <bhelgaas@google.com>
Date: Thu, 18 Jul 2019 07:58:52 -0500
Message-ID: <CAErSpo5S=VyyV6Euzf7qhO0zukU_mnXqJgEhy9fwR0AYf4LTpA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Prefer pcie_capability_read_word()
To: Frederick Lawler <fred@fredlawl.com>
X-Mailman-Approved-At: Thu, 18 Jul 2019 16:33:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xzSmfnXRcQ0lncJ4oY1al5Tz1krJ5LsMFDXPD4J+9Yg=;
 b=vrDiNZ9Rnx+Zqc1cpL3YQZDzoErYg0d+VFDXepCbcF5cGqaeFx3c5BM0tQ4QkrU+Dy
 eFw7529GaRzASlFP2QTx4bc+pWcBPFWDu83jKCCl5zrzGxW6xXSB6aB78CJM2XP/7g6G
 m4Qj9Xmmtms+/YX1I6yLI3HSgIxoQjQo6HVkQ3S2L3MccYLA3RNRhq2hYgbFhvO2XjbT
 RhPHTJqDlRmTuE2cHcHNErAT2w67a168Rqb9Dhq/MDemJRn86AupD5qAmlvHcKGLjcTX
 M/bfxIMC6vKZw+ZYxrx2/4R+pffU7qa4XIVMpKXPSyIY44DjzV9bD3Ie/idMEctL5wDk
 JkNQ==
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
Cc: David Airlie <airlied@linux.ie>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgOTowOCBQTSBGcmVkZXJpY2sgTGF3bGVyIDxmcmVkQGZy
ZWRsYXdsLmNvbT4gd3JvdGU6Cj4KPiBDb21taXQgOGMwZDNhMDJjMTMwICgiUENJOiBBZGQgYWNj
ZXNzb3JzIGZvciBQQ0kgRXhwcmVzcyBDYXBhYmlsaXR5IikKPiBhZGRlZCBhY2Nlc3NvcnMgZm9y
IHRoZSBQQ0kgRXhwcmVzcyBDYXBhYmlsaXR5IHNvIHRoYXQgZHJpdmVycyBkaWRuJ3QKPiBuZWVk
IHRvIGJlIGF3YXJlIG9mIGRpZmZlcmVuY2VzIGJldHdlZW4gdjEgYW5kIHYyIG9mIHRoZSBQQ0kK
PiBFeHByZXNzIENhcGFiaWxpdHkuCj4KPiBSZXBsYWNlIHBjaV9yZWFkX2NvbmZpZ193b3JkKCkg
YW5kIHBjaV93cml0ZV9jb25maWdfd29yZCgpIGNhbGxzIHdpdGgKPiBwY2llX2NhcGFiaWxpdHlf
cmVhZF93b3JkKCkgYW5kIHBjaWVfY2FwYWJpbGl0eV93cml0ZV93b3JkKCkuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBGcmVkZXJpY2sgTGF3bGVyIDxmcmVkQGZyZWRsYXdsLmNvbT4KCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwY2lfcmVhZF9jb25maWdfd29yZChhZGV2LT5wZGV2LCBn
cHVfcG9zICsgUENJX0VYUF9MTktDVEwyLCAmdG1wMTYpOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGNpZV9jYXBhYmlsaXR5X3JlYWRfd29yZChhZGV2LT5wZGV2LAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lf
RVhQX0xOS0NUTDIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZ0bXAxNik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB0bXAxNiAmPSB+KCgxIDw8IDQpIHwgKDcgPDwgOSkpOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdG1wMTYgfD0gKGdwdV9jZmcyICYgKCgxIDw8IDQpIHwgKDcgPDwgOSkpKTsK
ClNhbWUgY29tbWVudHMgYXMgZm9yIHJhZGVvbi4gIExvb2tzIGxpa2UgYSBsb3Qgb2Ygc2ltaWxh
ciBjb2RlIGJldHdlZW4KcmFkZW9uIGFuZCBhbWRncHUuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==

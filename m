Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBCD86A99
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 21:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAE58931F;
	Thu,  8 Aug 2019 19:31:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF6A6E8B2
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 19:25:37 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id y8so1826218plr.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 08 Aug 2019 12:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=ZG7Aiu7OQw3f16u3W7GLfaAF8S8vqKrbpAk/id0cgaA=;
 b=nta8/gKG1gNcbagpDO8NOhHVzOX7318VpRo2V9eiGih0nMc67/1aB1zR9qN5fo25Ea
 YlbMCyEyV5zt/gHHyLhLzAdXbkG/+W1u3VMPVEEjCfUIgFMpKP2Ru69HJavE62k0H4Yx
 W2x0qnBFwJxBMLg1VP7rr9iQhwkgw51labc8rBpAbkXPyv1RrmHSE7CQLdLN/628bNdX
 HPYXW5oF3Mvo0jeiJTBjdpNrnQiCBYpo7jtMxGC3bheOCKpRcGs0al2AYfrWMy47o7Mb
 lxKCNp3m4b+k9subotUBlpZ63NZitBaNW+5Sif8sW3rHa/+AephAfb5e8nZODH4+LgSg
 JwvQ==
X-Gm-Message-State: APjAAAU82sdfwzMEOEHw3Q3KX1leDkTvL7zqzBoqkPFfXmhFYY9eIZhT
 Kohi6pKiiIAIDnuvVvTjkOr5FrOc3Ug=
X-Google-Smtp-Source: APXvYqzXtoL4CK4Jrf1h0ByToUo3gH/95WHymx6k/tyUsz16HcxxEhrxIW22Vilqk7ceZ9+THb0mzA==
X-Received: by 2002:a17:902:9041:: with SMTP id
 w1mr15581882plz.132.1565292336806; 
 Thu, 08 Aug 2019 12:25:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id u7sm86278852pgr.94.2019.08.08.12.25.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 12:25:36 -0700 (PDT)
Date: Thu, 8 Aug 2019 12:25:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tao Zhou <tao.zhou1@amd.com>
Subject: Re: drm/amdgpu: replace readq/writeq with atomic64 operations
Message-ID: <20190808192535.GA18697@roeck-us.net>
References: <20190807025640.682-1-tao.zhou1@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807025640.682-1-tao.zhou1@amd.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Thu, 08 Aug 2019 19:31:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=ZG7Aiu7OQw3f16u3W7GLfaAF8S8vqKrbpAk/id0cgaA=;
 b=Jq5sVfKQ0hPrMipd9tzdgBE/vL9JwA87pRhTvAGhJ+gFsTDoc4nTfq8TTeXd+cQJOr
 /+HEtGw1xWZibB1tYeeur1Z9xJDMLYgh84oXhYniny9x/9g31Zy5HneeQONS5cKtT45b
 5d1x3crOYqm2FjoWj15VFI7D6HtdpA1WqtoR2k+YWu5xHbmkmR+9oFVOuP4LWArHfl/8
 KOrdouH2ST1edCO3dHMmTzDmBy1Af1n9HO2Iz3NaQOeB3AbHdDOdSSi3O7YToixYL03j
 sqSk4CyBuf6TUuwiXsv9PRYHKcdAdzo/+5ILhykGFg7q+hJj8uBiugX1cbWMrcJDCUqp
 IHWw==
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
Cc: linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, broonie@kernel.org, linux-next@vger.kernel.org,
 alexander.deucher@amd.com, akpm@linux-foundation.org, christian.koenig@amd.com,
 dennis.li@amd.com, hawking.zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMTA6NTY6NDBBTSArMDgwMCwgVGFvIFpob3Ugd3JvdGU6
Cj4gcmVhZHEvd3JpdGVxIGFyZSBub3Qgc3VwcG9ydGVkIG9uIGFsbCBhcmNoaXRlY3R1cmVzCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgo+IFJldmlld2Vk
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CgpSZWdhcmRpbmcg
dGhlIGNsYWltIHRoYXQgdGhpcyB3b3VsZCB3b3JrIGZvciAzMi1iaXQgeDg2IGJ1aWxkczoKCm1h
a2UgQVJDSD1pMzg2IGFsbG1vZGNvbmZpZwptYWtlIEFSQ0g9aTM4NiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLm8KCnJlc3VsdHMgaW46CgogIC4uLgogIENDIFtNXSAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5vCmRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYzogSW4gZnVuY3Rpb24g4oCYYW1kZ3B1X21tX3Jy
ZWc2NOKAmToKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jOjI3OTo5
OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYcmVhZHHigJk7Cgpk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmM6IEluIGZ1bmN0aW9uIOKA
mGFtZGdwdV9tbV93cmVnNjTigJk6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYzoyOTg6MzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKA
mHdyaXRlceKAmQoKVGhpcyBpcyB3aXRoIG5leHQtMjAxOTA4MDguCgpHdWVudGVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==

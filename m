Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EF462D16D
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Nov 2022 04:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1EB10E530;
	Thu, 17 Nov 2022 03:05:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60E510E19E
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Nov 2022 23:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:From:In-Reply-To:Subject
 :References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZWlzk8rbg03ns/vYp1+OP6O/Q3QNth3Rr/Uqpn/Jonw=; b=KRO705Zb1rVMDx6Svpms4DDF15
 InZXx4ZJ3EZQJwV2Ldci8uzzRaxzdrd2IgHcSHVbXsvxQcUBMEPnAI8BUaaEGnqcn8iQ9cRShpk21
 BKF8SAvy02mEq7SkPjHy0Q9koiqDoJHwtZB6w8byWUkIsJLRbGf2P95KuEPUjKJpvg1aVSHphsfxr
 LtYcI68DlORASBBIotpCgDBzGP9t23zuoQSbUzjZP95tU7RBiGQzCiVPQ7phnhGP5+3AwVzL3OPWw
 gdRBr4Rm4Jub3Z7tafEDTXpP/U3E3znBb0cSwUUYKAmDGPcbmHVkLC9YvKsFHdo9u46e7KXjt6DrN
 omS8QQuQ==;
Received: from [177.102.6.147] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ovRte-0027YO-6N; Thu, 17 Nov 2022 00:32:46 +0100
Message-ID: <0b977941-c27d-47a9-5a5f-193fbf2d3db6@igalia.com>
Date: Wed, 16 Nov 2022 20:32:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
To: amd-gfx@lists.freedesktop.org
References: <20221116164006.2830029-1-alexander.deucher@amd.com>
Subject: Re: [PATCH] drm/amdgpu/psp: don't free PSP buffers on suspend
Content-Language: en-US
In-Reply-To: <20221116164006.2830029-1-alexander.deucher@amd.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 17 Nov 2022 03:05:30 +0000
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
Cc: alexander.deucher@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Thanks for the fix, feel free to add my:

Tested-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

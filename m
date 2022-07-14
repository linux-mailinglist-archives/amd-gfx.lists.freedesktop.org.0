Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 394825755C3
	for <lists+amd-gfx@lfdr.de>; Thu, 14 Jul 2022 21:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747F9113847;
	Thu, 14 Jul 2022 19:21:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275CE1137CE
 for <amd-gfx@lists.freedesktop.org>; Thu, 14 Jul 2022 19:20:16 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4LkPTC5mtNzDqYn
 for <amd-gfx@lists.freedesktop.org>; Thu, 14 Jul 2022 19:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1657826415; bh=NljIR2hRvpDPIFRLP8my4DpZzBVxkv9GDIm5oTZgAew=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CNqKc63PQ00VAoRApqTYAovZZPi3azBs0PKH4J7Q4Gn6efnjn5kuGrNwKYP9crtOh
 Oi1urh0C389ziTZt1HQeks7JI0tbiPIzi53YaixhN7OLpXOG6QhSn1rb8BtP+B/sXV
 ocE3Qj2bN5/r7gCLikQHzdUKyLHja3QtRTn9wjE4=
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4LkPTB63SSz9sdL;
 Thu, 14 Jul 2022 19:20:14 +0000 (UTC)
X-Riseup-User-ID: C4CE730A79D46741672310BD4CC985878FCF1513D0B1E1B7CCD23BEBD93E5F8E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4LkPT50pCVz5wJh;
 Thu, 14 Jul 2022 19:20:08 +0000 (UTC)
Message-ID: <94dad704-d81a-7dc2-423d-1f728bcb5548@riseup.net>
Date: Thu, 14 Jul 2022 16:20:06 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 01/12] drm/amdgpu: Write masked value to control register
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mairacanal@riseup.net>
References: <20220714164507.561751-1-mairacanal@riseup.net>
 <92eebfd3-4234-b3fa-87cc-c48b3deec33f@igalia.com>
 <CADnq5_OGGMTDhacr+x5jO=DttEmTvsMWPLZGxcQ=_GJS4B-r+Q@mail.gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@riseup.net>
In-Reply-To: <CADnq5_OGGMTDhacr+x5jO=DttEmTvsMWPLZGxcQ=_GJS4B-r+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Jul 2022 19:21:29 +0000
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Magali Lemes <magalilemes00@gmail.com>, David Airlie <airlied@linux.ie>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 xinhui pan <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, Leo Li <sunpeng.li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Isabella Basso <isabbasso@riseup.net>, Harry Wentland <harry.wentland@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Às 16:14 de 14/07/22, Alex Deucher escreveu:
> On Thu, Jul 14, 2022 at 3:05 PM André Almeida <andrealmeid@igalia.com> wrote:
>>
>> Hi Maíra,
>>
>> Thank you for your patch,
>>
>> Às 13:44 de 14/07/22, Maíra Canal escreveu:
>>> On the dce_v6_0 and dce_v8_0 hpd tear down callback, the tmp variable
>>> should be written into the control register instead of 0.
>>>
>>
>> Why? I do see that tmp was unused before your patch, but why should we
>> write it into this register? Did you manage to test this somehow?
> 
> The patch is correct.  We should only be clearing the enable bit in
> this case, not the entire register.  Clearing the other fields could
> cause spurious hotplug events as it affects the short and long pulse
> times for the HPD pin.
> 

Got it, nice catch Maíra :) Next time, please add this kind of
information in the commit message.

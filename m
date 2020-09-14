Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B8268DC4
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Sep 2020 16:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E5D6E4AF;
	Mon, 14 Sep 2020 14:32:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4A389DD2
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Sep 2020 10:08:43 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 18A443A690A
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Sep 2020 10:08:40 +0000 (UTC)
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net
 [82.255.60.242]) (Authenticated sender: hadess@hadess.net)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2A0691C0011;
 Mon, 14 Sep 2020 10:08:16 +0000 (UTC)
Message-ID: <64d9cdc921ed33843602ad8dac96b994234e0ffd.camel@hadess.net>
Subject: Re: Power-saving/performance toggles for amdgpu
From: Bastien Nocera <hadess@hadess.net>
To: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Sep 2020 12:08:16 +0200
In-Reply-To: <CADnq5_NdfbJ9RAqMMxLYfvC70QPyuTQ8ggRZM2uYZAOuQx_vSQ@mail.gmail.com>
References: <36ccfc64de628c060a736b8e05ae076246b686fc.camel@hadess.net>
 <CADnq5_NdfbJ9RAqMMxLYfvC70QPyuTQ8ggRZM2uYZAOuQx_vSQ@mail.gmail.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Sep 2020 14:32:30 +0000
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, 2020-09-14 at 01:46 -0400, Alex Deucher wrote:
> 
<snip>
> On older radeons (e.g., pre-GCN hardware), there were separate power
> states for battery and AC, but these asics are supported by the
> radeon
> kernel driver.  None of the hardware supported by amdgpu exposes
> anything like that anymore.  The rest is mainly for profiling and
> debugging.  For more information see the relevant kernel
> documentation:
> https://www.kernel.org/doc/html/latest/gpu/amdgpu.html#gpu-power-thermal-controls-and-monitoring
> I don't think there is anything you'd want to tweak there.

That was very helpful, thanks very much!

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

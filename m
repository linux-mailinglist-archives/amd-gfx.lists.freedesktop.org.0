Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D9D27B62B
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Sep 2020 22:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C360989E14;
	Mon, 28 Sep 2020 20:24:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D6C89D66
 for <amd-gfx@lists.freedesktop.org>; Mon, 28 Sep 2020 20:24:38 +0000 (UTC)
Received: from murex.cb.ettle ([143.159.226.37]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.179]) with ESMTPSA (Nemesis) id
 1MV5KC-1jx6Xh2s2Y-00S8RA; Mon, 28 Sep 2020 22:24:31 +0200
Message-ID: <4e81ba76607f5919a6a1b9210b15f10668fb704b.camel@ettle.org.uk>
Subject: Re: [PATCH] drm/amdgpu/dc: Pixel encoding DRM property and module
 parameter
From: James Ettle <james@ettle.org.uk>
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>, 
 christian.koenig@amd.com, Harry Wentland <harry.wentland@amd.com>, Alex
 Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Sep 2020 21:24:30 +0100
In-Reply-To: <aa941ec6-994e-30c0-74fc-0d13734204bf@amd.com>
References: <7cc7d590-f713-2060-6bac-37bed0df618a@ettle.org.uk>
 <CADnq5_OEzoEP93+MsGN1tspy0OrxVTkujKUhs+6LryVApvERkw@mail.gmail.com>
 <286845a3-4903-c169-aa36-1eb986492ea3@ettle.org.uk>
 <CADnq5_O8Wzddr3LryTuQ5Jqc5yt51wqkxv6zbSbr0_RBSQCA4g@mail.gmail.com>
 <967f82b1-cf5b-473b-c9b3-d9f9df588cc7@amd.com>
 <ad59a8c59d52c40a89b7b4fd032df043e0747f27.camel@ettle.org.uk>
 <6583647a-7147-4f5b-0412-d3be77ca7fe2@gmail.com>
 <aa941ec6-994e-30c0-74fc-0d13734204bf@amd.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:L8n9KcZhnH/VMKwtVbuxdrgzwyTxBD6dTCzakEVGeFQydZxSJ96
 kdBxvObpMzvN4mrHYZD5+Rd7FzU0ZQ8vyn+JGNYFFqzjeGfJPWoNK1AVKuZnHMKdOGhFdB8
 aGwWD2qSKtA+L4wkWe5h/j1LwXvZRGYPURgGo7Si5+xRjrUW7gIcrS3jhbaq2VYsSMfuwzm
 DxMQQZykjcv6za6SmLIaA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1UbJ9VJ4JXo=:/DMTjkr1hAcLjQZaXJ9jvV
 KTv3BZlIuZJvHQUWkCNc1MYOY4X2cXNZKh4xV9ihTevxdSxcIXZGWfrrWl8l/ZLAZC5xyly67
 AQLCwU0ASFfKrGb7u/S4Ayn5A0xLm918HcJAy1gCNcZlvt3Z/OhGcwPLVUe0rGRf2u65mbJ8A
 6Opr6i/IKpK9mgzazOU/xvToWAnn7XeEqGbQTTd3mhJnrQHN18UxGqB/AFFGZG8DBx/VXV0wY
 Z72d90RfPLT9jGF1y4AALwyxzXmjFbqDUzER/ehNjQSqZ5EFTEwohzOdSXPhtGxeo1Gud7KL3
 m56jE0nlrnWmFvEqL8hl7K8qdbtoLNijtBSr7pt7HyhmS4BiPZQtBjF8aM4oBdiFnQmUOSMxT
 TWgV8sTnyhVvAMw2guSYl+drhyALiVEW+QzGYa4blq7T0WK+FmLRvm5xjV/PsBqEs38m32pfG
 EizZAzFiEVcCXQ56HS6gUAEtszbiK7Psr+mwaMhGHWjfY2DM5AINPNnSS8Fw3cy/LyMAd+MOS
 zvUeuUTSrG/KY4mixPp2af9cjeVivrem5ozl1B5cbKPlaF5Yta/812cWBnH8MbvqrHzlZfl3+
 CM/44/UgBHo8Jr355yZ6Ku8/++M22vv9hzT29RFA4Ky2i8sACfZwXglAsijYYAAPm+MhyJuzg
 MLYG9pYqEpNfVu+epxa7iWubBlIwzDB2tZDC3eT6Otizw5yujNsGu3uA8zlTjDHs/jc6KkvDA
 k9TinPnuOwqHRfcOKqdv14sT3Lxz3kXmymgHOvWQFrLDCqRtJk1BPIELVsx+lxhiRGZu9kU9B
 mYm/ZBurKIpuGIjbw8osJ+fDL1T871M459qfa7pM8Ro4C0t/LhgPzZY6KBOl4xb0jyXKVeI
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
Cc: Harry Wentland <hwentlan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, 2020-09-28 at 16:12 -0400, Kazlauskas, Nicholas wrote:
> 
> The problem with the module parameters is that it'd be applying a 
> default to every DRM connector. No way to specify different defaults
> per 
> DRM connector, nor do we know the full connector set at driver 
> initialization. The list is dynamic and can change when you
> plug/unplug 
> MST displays.

I just want to point out that the module parameter does support
connector-specific values, e.g.

  amdgpu.pixel_encoding=HDMI-A-1:rgb

should only affect the connector named HDMI-A-1 (unless I've coded it
wrong -- I don't have enough video ports to test it thoroughly). If
there's no such-named connector the parameter should be ignored. In
contrast with no named connector given, e.g.

  amdgpu.pixel_encoding=rgb

should match any connector. Multiple connectors can be given comma-
separated. I admit the solution here is crude -- it just stores the
string and rescans it when required.

-James


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

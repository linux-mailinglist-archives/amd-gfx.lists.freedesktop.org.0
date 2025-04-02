Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F9AA79E87
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Apr 2025 10:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F9C10E924;
	Thu,  3 Apr 2025 08:54:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from irl.hu (irl.hu [95.85.9.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B375E10E709;
 Wed,  2 Apr 2025 12:00:50 +0000 (UTC)
Received: from [192.168.2.19] (51b692a2.dsl.pool.telekom.hu
 [::ffff:81.182.146.162]) (AUTH: CRAM-MD5 soyer@irl.hu, )
 by irl.hu with ESMTPSA
 id 0000000000080D7C.0000000067ED26F0.00082F7D; Wed, 02 Apr 2025 14:00:48 +0200
Message-ID: <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu>
Subject: Re: amdgpu_dm_connector_mode_valid regression
From: Gergo Koteles <soyer@irl.hu>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: regressions@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Date: Wed, 02 Apr 2025 14:00:47 +0200
In-Reply-To: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
References: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 03 Apr 2025 08:54:04 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

to: Dmitry's new address
cc: regressions

On Wed, 2025-04-02 at 12:40 +0200, Gergo Koteles wrote:
> Hi,
>=20
> While playing with
> https://lore.kernel.org/all/61c3df83ab73aba0bc7a941a443cd7faf4cf7fb0.1743=
195250.git.soyer@irl.hu/
>=20
> I found a regression that prevented some EDID DTDs from being selected
> in some specific cases.
>=20
> This is the first bad commit:
> b255ce4 ("drm/amdgpu: don't change mode in
> amdgpu_dm_connector_mode_valid()")
>=20
> I think the problem is that decide_crtc_timing_for_drm_display_mode()
> function tries to copy the crtc information from the preferred mode,
> but that's not filled yet if the first one is the preferred one and
> it's not the one with the maximum refresh rate.
>=20
> amdgpu_dm_connector_mode_valid()
> create_validate_stream_for_sink()
> create_stream_for_sink()
> decide_crtc_timing_for_drm_display_mode(&mode, preferred_mode, scale)
>=20
> It works if I call
> drm_mode_set_crtcinfo((struct drm_display_mode *)mode, 0) before=20
> create_validate_stream_for_sink()
> in amdgpu_dm_connector_mode_valid()
>=20
> or=20
>=20
> if I comment out the decide_crtc_timing_for_drm_display_mode() in
> create_stream_for_sink()
>=20
> but a better fix than these can be imagined :)
>=20
> more information:
> https://gitlab.freedesktop.org/drm/amd/-/issues/4085
>=20
> Regards,
> Gergo
>=20


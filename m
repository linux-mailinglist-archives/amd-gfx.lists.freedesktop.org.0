Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /kbGH+U65WlWfwEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 19 Apr 2026 22:28:21 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0BF425731
	for <lists+amd-gfx@lfdr.de>; Sun, 19 Apr 2026 22:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E29410E11F;
	Sun, 19 Apr 2026 20:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BE220zyi";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C6810E11F
 for <amd-gfx@lists.freedesktop.org>; Sun, 19 Apr 2026 20:28:17 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso2363445e9.1
 for <amd-gfx@lists.freedesktop.org>; Sun, 19 Apr 2026 13:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776630495; x=1777235295; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nfoXfyGf9ObR4xJ/3axvDW8oWrNPF3XyHs7QsL9Tghk=;
 b=BE220zyi9PpPK+6u7il5NgGaNMFLlEvHsmH6YAWDJtHWowjRIMIgO//qIoU+XEDRIu
 YSmVDn+pSL+XVJUz6SW4dUkDpepC/2xUIdKCBlditxrCEBUVrAlMXqzQng2sNVy5LWRn
 8kxfjopVRY+pNam0rtNgLnoAW7L+1tApPFG4s6AzKYfW2NExvglK1x9G8nIhhFdKHLwl
 Xwdn2TYGRcZ1QBeQqWxiCx2EZZHz7nA4iarp+SEa4U/CXJSFSrLO2aBMcLbgQP1ZPEv2
 adXL8UlgC8aGd7FwvS5UUA2XhHqeq+A+yldxh8/oGsIOTG2rxjwf5o6/AELWaj27EXjs
 QqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776630495; x=1777235295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nfoXfyGf9ObR4xJ/3axvDW8oWrNPF3XyHs7QsL9Tghk=;
 b=gD6wRB0P8lrimhxWw4YrI89PJqKEgvxjySBpxVKMqBm049qBrILDCm9WKV/ShWR7VX
 tgcH2Oe2VcZJCKqUWjTyBpAFK57iLKwbsuVYU5A/6rCiOPKekaO05+FgVeOhJd6GaakQ
 Nd2NQXhntarXgGt4Yepq+DWCcvNeivVEvBqvcJIGzN2PkeBSFOuPwx8PIzxADU5rMXe9
 89eZeYICtPlsr7MJ42AQP4ptqIlaEGKjzQqqnOMSdjfqr5lACjKm27zr1KZdLjWd/w0a
 v2tS4l9RcbPU9mf0xFCsPMXSqUK66ObrtC9lxQbTMJhQYLsC+hhuTYzDKBMJcnRMnHeW
 JOMg==
X-Gm-Message-State: AOJu0YxeYPXXX3xxHj5SdBkpsVxVR4CYfGZM4gkx3f+ykNwveMvhV/l6
 egETP2UmVAL0X7hHSzcEywxMtSAPqoUlrZDgqa8Lk/bOb3TjHRCUAql2eDvjtQ==
X-Gm-Gg: AeBDieux55TeDGCqFIupoyO3F4c5LbpusMo0btoJYNwChWcFWCJxIVDNKu7sHcH69FV
 j8SmgP6452iwiou72gw8q0DW/XalYoi1U2bKQGrFz6XSo985AQ1DnxfuRJ+y5wYXMxROaP2Sd45
 tqAtlqNgsXDFfLwQD/hg7XKVVGj3+wAV7CQInlUUBPniM/MfMTFqvhww3U6J4/9VwpAUb2KVlaC
 e5/upvgwHhfvjKloQLsso9hCfp3DIltxOc6LzeT1rxTk++iFQcwzLOylQospL3jQ8rVeuItBvfI
 pXbl2JpnuV/dEsl5n5ZdP/W0tolpLOvyQ5+49vC5xtKOcxKNfwjYOMsihs09Uv8ku+5yew2MNaV
 gziv8dKUS7WgiSXeSgd9Phd7QBuS4fdfTq7jsvD9GnQOdI7OnVtNHLMthjVcz4S2xWwskHAeEvL
 Pjvqs3d9j4uN/NKdzlsvILVkLwwU4NmNdkp8osWB1AxT3NjxX3EDuT29V/kBVX5wNprQY4eTJ/C
 wJW/jJGigM=
X-Received: by 2002:a05:600c:46c8:b0:488:ae4e:51a5 with SMTP id
 5b1f17b1804b1-488fb778d5dmr155543815e9.15.1776630495366; 
 Sun, 19 Apr 2026 13:28:15 -0700 (PDT)
Received: from timur-hyperion.localnet (5E1B98A2.dsl.pool.telekom.hu.
 [94.27.152.162]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb735d3dsm147442195e9.2.2026.04.19.13.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Apr 2026 13:28:13 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] drm/amd: Adjust ASPM support quirk to cover more Intel
 hosts
Date: Sun, 19 Apr 2026 22:28:12 +0200
Message-ID: <2231677.9o76ZdvQCi@timur-hyperion>
In-Reply-To: <20260419041652.17673-1-mario.limonciello@amd.com>
References: <20260419041652.17673-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: BC0BF425731
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sunday, April 19, 2026 6:16:52=E2=80=AFAM Central European Summer Time M=
ario=20
Limonciello wrote:
> Some of the same issues identified in commit c770ef19673fb
> ("drm/amd/amdgpu: disable ASPM in some situations") also affect
> Tiger Lake systems with GFX11 connected over USB4. Widen the net
> to also match these hosts.

Wouldn't it be better to check that the connection is through USB4 rather t=
han=20
entirely disable ASPM accross all these families of CPUs?

>=20
> Fixes: d9b3a066dfcd3 ("drm/amd: Exclude dGPUs in eGPU enclosures from DPM
> quirks") Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/5145
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c index
> bc7e96b58d3fc..b11c4b5fa8fcd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1334,18 +1334,15 @@ static bool amdgpu_device_aspm_support_quirk(stru=
ct
> amdgpu_device *adev) #if IS_ENABLED(CONFIG_X86)
>  	struct cpuinfo_x86 *c =3D &cpu_data(0);
>=20
> -	if (!(amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(12, 0, 0)=20
||
> -		  amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(12,=20
0, 1)))
> -		return false;
> -
> -	if (c->x86 =3D=3D 6 &&
> -		adev->pm.pcie_gen_mask &=20
CAIL_PCIE_LINK_SPEED_SUPPORT_GEN5) {
> +	if (c->x86_vendor =3D=3D X86_VENDOR_INTEL) {
>  		switch (c->x86_model) {
>  		case VFM_MODEL(INTEL_ALDERLAKE):
>  		case VFM_MODEL(INTEL_ALDERLAKE_L):
>  		case VFM_MODEL(INTEL_RAPTORLAKE):
>  		case VFM_MODEL(INTEL_RAPTORLAKE_P):
>  		case VFM_MODEL(INTEL_RAPTORLAKE_S):
> +		case VFM_MODEL(INTEL_TIGERLAKE):
> +		case VFM_MODEL(INTEL_TIGERLAKE_L):
>  			return true;
>  		default:
>  			return false;





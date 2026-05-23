Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJC9DbVRFWraUQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 09:54:29 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C86345D2197
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 09:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66CB10E5FA;
	Tue, 26 May 2026 07:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="sewmbVmj";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D076710E323
 for <amd-gfx@lists.freedesktop.org>; Sat, 23 May 2026 20:50:36 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-c70c112cb61so6835667a12.0
 for <amd-gfx@lists.freedesktop.org>; Sat, 23 May 2026 13:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779569436; cv=none;
 d=google.com; s=arc-20240605;
 b=LaRlnH2SJ2O9StJ//bCTzZwCB7LRFne+pzsQ2yl9HI4mAQcxvRQRRN6l/4BYTxT4ld
 VvESQuzLLo9KO0mFlBnxd+gIPsZ8hIAzzHMx7YQ3Sf+AA/coQRfDkQoyeY7icWjztBiL
 mLM1V47sUq2chb/hfUAi8kqxpxdQYwGzE77NuV48JWkiLna9XjBIELPk/WJTKZC6knS0
 zXaTBeF/+MGwnDVy6UEQ8pH/ixdi892UHKofQOE9+XXxFotfHxOKXEa0PfDBaI2BmCXI
 pG7WDK9k9l8QQFtFs/+y9Tup4SJX6oun4wctpbHjWiuA5JQvEY3QEeacj+w0IfVWtRMA
 ZwnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IyTQ98dxYkPfqT9yOtXNuJEPxSlMOIrwYBGil6h3LZ0=;
 fh=hCUCfkLP5eK3EwDL6ydbYDw/6V5kuf7m8gj3sUwnslY=;
 b=D8r3a1cH5aVtWtNiB7oClNbhJF7iueUYNq8eV7F+AxvhCnaUR+2J2MGHZD1Iq6m/1u
 MrZOI+jT1qF/wsKc5Y2OcdiEqQli3auePKNqwlelrlxZ601NqgjDxRHMYXl77V3f436P
 NLL/XxKQZYbJqHZYOSclZPP9YbpCVOmWU0JtuCGRisB5cGOAsaSSmSCbInE2olP3LmH9
 RfFNV8lmM6/Ip5uQdlsPdfEkvKFmSG1Ma9ElBYazn631z7mcQ4FbB2D54A+FNzKPzMoC
 vFuyvTAm8d3Wj7L/088bH/rU7W68iNi5MVuNo7ydu6nTHY1JblG6dIQ0ycIaJM8//LBS
 pEaQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779569436; x=1780174236; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IyTQ98dxYkPfqT9yOtXNuJEPxSlMOIrwYBGil6h3LZ0=;
 b=sewmbVmj8rCgVYV/e0JWs/1Vf95PNIcbnoksI1xT//9Cl7XLkdnrBvpN7nQgsyCnFC
 qSPAcO7038sQWctLy3pHCh04aOiWGnWL8v1yCUtHoZ3RxWeSfqjIkaLKAa+riKATloGP
 hxkMBH9/D854ZtWOXzR69AvvUdeNTj+/U1H+6s+SxjD0E7lCa3NO0U+e1LmxvXzKWFN9
 AkX5GiXMX/pFhFU0O/AVHjvc5fXKH1Gq3sRLH8EkuYjJg7rMMDBc+aB6b3H6fb//zcpE
 Y3B9Gn/T/AFORKQlVkas/ucjOgdITECubwK0EbTQKVa3nlOUiJgs0B5O0SUebObuOqVE
 2ZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779569436; x=1780174236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IyTQ98dxYkPfqT9yOtXNuJEPxSlMOIrwYBGil6h3LZ0=;
 b=D8dzSuaB/+onHPU2uqxsP73cAi/wwuhc1QXmDdNsqbeGYOf6+kxIkc0oplshrZj6P4
 jRESj2f5ckeXUwTeImCAKgO+Xn+8hjon+RV6dxH4WsMkBAjnaugyA0wmixw4ABQdP5CA
 +d/1wzRrER4mXtvz5fsDHg/gsHy+FpIErjTDF7/uvvzmBKCaLN1UE+hqTqDBfpX6CR2N
 6ClJlF7EkozAB2AvZBsuZsmIRZJPkS0bIqZJ2u6lqX6y2bc7vpFjqLllsn9zuKiebAOL
 QMa4C3rSP/QZXtdhhnEUz31LUNtm66IUcsdcGEudvNgKgrRDRNgaJ9xVPAcu27BSZRvZ
 V3oA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9aHwkBjmFqFUA+ENzws/ZdPkZDp9RWbQf0v54vYAZYXcMhg1WAc+mgIpKJQ/LaYscbphl0LwCF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjJAB/a6biB9GF/83/A4Lw6i4y+jCWsVySzh/PMgvdrVXBavbz
 UDWed9KirTu1NqbAY3Q2DKSJQI0mFUXhcNTonRufrSyE0FH85TdD6K7g326/xmVZc1yAjzXq7ix
 1j/aljgaNVJIk5lT2Hbst5umoHnEFgvE=
X-Gm-Gg: Acq92OF9zyMJkpS9bV4klwow731+NSWAP52DosfjWZ9Ktnvuv6FFQLV30ktgGRiSPUR
 y+OOpv0h/Jufmzr5ywC35T1TYaWUZTCbEPnQ/6n6hmiCVGq7qjpLr5+33ZYyWRUJkmhoDP5gaGe
 JJvP91VsKMJN/t8gJmYmgEu8KbttrMIvGMcMIE1Iluq+8PKuGZa1j0hbPPahz/ypX1tDEHjDyne
 1+2+TfWFDnsbA54qCcaAANX0bVncqfpBjKCUWBajCjB5wdSKAiRVRBRvtjV4plA1vRChUo0lgCJ
 LzwyY7SK/wlK0fshcd7R9vAZCppubyzLIvTcpj5E3fgLzNtfziUZBrwsVE+0DTfGLZin3un6
X-Received: by 2002:a05:6a21:3285:b0:3a0:adc5:52c1 with SMTP id
 adf61e73a8af0-3b328c4cbf0mr9292019637.11.1779569436223; Sat, 23 May 2026
 13:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260430010405.52591-1-kenner.linuxdev@gmail.com>
In-Reply-To: <20260430010405.52591-1-kenner.linuxdev@gmail.com>
From: kenner azevedi <kenner.linuxdev@gmail.com>
Date: Sat, 23 May 2026 16:50:25 -0400
X-Gm-Features: AVHnY4JlT12H_E0ODt_22_aaUdV4UquI6AiBAxfDaGZ9HELRKphl73htp1x5-BY
Message-ID: <CAFHy_waHvX5cDPu4=7R4nQzWBudYP2BwT6aiq0jHf4nCT3tGzw@mail.gmail.com>
Subject: Re: [PATCH] Fix kernel-doc for amdgpu_display_manager
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Rodrigo Siqueira <siqueira@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 26 May 2026 07:53:08 +0000
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
X-Spamd-Result: default: False [-1.21 / 15.00];
	DATE_IN_PAST(1.00)[59];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER(0.00)[kennerlinuxdev@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kennerlinuxdev@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C86345D2197
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Team, good afternoon.

Any update about this patch?

Regards,

Kenner Azevedo

On Wed, Apr 29, 2026 at 9:04=E2=80=AFPM Kenner de Azevedo dos Santos Mirand=
a
<kenner.linuxdev@gmail.com> wrote:
>
> The struct boot_time_crc_info is not described in amdgpu_display_manager.
>
> Running the `make htmldocs` is showing the following warning :
>
> WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:715 struct m=
ember 'boot_time_crc_info' not described in 'amdgpu_display_manager'
>
> i added the description that fix the warning and describe the struct.
>
> The warning is not showing anymore in make htmldocs after change.
>
> Signed-off-by: Kenner de Azevedo dos Santos Miranda <kenner.linuxdev@gmai=
l.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 74a8fe1a1999..201b4796b591 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -347,6 +347,7 @@ struct hpd_rx_irq_offload_work {
>   * @dmub_aux_transfer_done: struct completion used to indicate when DMUB
>   *                         transfers are done
>   * @delayed_hpd_wq: work queue used to delay DMUB HPD work
> + * @boot_time_crc_info: Stores CRC information collected during boot
>   */
>  struct amdgpu_display_manager {
>
> --
> 2.43.0
>

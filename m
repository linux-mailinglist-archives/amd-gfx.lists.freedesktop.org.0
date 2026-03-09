Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CulIlJEr2n3TAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Mar 2026 23:06:10 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CE22420E4
	for <lists+amd-gfx@lfdr.de>; Mon, 09 Mar 2026 23:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC5F10E5C8;
	Mon,  9 Mar 2026 22:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jC0WaLVw";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C06510E5C8
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Mar 2026 22:06:06 +0000 (UTC)
Received: by mail-dl1-f54.google.com with SMTP id
 a92af1059eb24-127337e3870so611942c88.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 09 Mar 2026 15:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773093966; cv=none;
 d=google.com; s=arc-20240605;
 b=bdD5ZzunauzPG0qzEsXJJwRTPmuq5gLUp3KFF78NUoW7uU+UF+noeNufDyjSp4qC3T
 mccpsr/UN8t8seFB8xelxPcTzBDUvjzE+V99yY1J/5Z0gJ1vm+9mirYs1i5xmMlq+v4v
 tXlHqZ8J9aVeeAA5EQyiY0ET4UN2A93dyU2LU/aLmHnkxMP0xC2K/uuc/DRc+IngspH/
 NZDkdTjXG9vFR+LhKOa2RJ2fY4bOvE1N3AIPfwtlj1daTK/Eqn+UJknvK88xt6J9xRvJ
 Eu57QoBYKszKbnLW6Kg20vSLL9dzMfGGCzQZGyia3XfeTG+LVnnhC6hNr5jt+7aY856E
 vT+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TQSe2YqM4taFyZW7Fl18ntWD1f3i6CTFSEMckg/bKo4=;
 fh=retVrYJWpx3hjJOJ+TrS8frzoL5iEtYv05aS8Cr2deI=;
 b=FwN8BJIV1BmDP3/IXYemdiW/+5TJzkialrJ5INKWCyICKIYVG3IJvdBkZ/8rNMLSZU
 1jyhGeQiQQwc1/kQM7I0aONtVa5muLhwKnp8Nu+vRitYM4hIt5csuRcynygAzo9F/fy0
 A27ot6vMwot+2C8uUtCViSn+ULQGso8eCaKsggG2G8nmSFWKv8lmS3B4KW7q2Fc3Kr2v
 hF9TsT2A9ncXMYTCyDWGZguW7qoWbFopuCL9PSnXLi0GJLINZKx3ilS+BHTNBEVYqgLX
 Jj6/ktoPF2R4Ic8SEID+KB0NOIOqi6Z5nonezsHFhsB6MoJTidEDZgwo8Wc9V/Z5epV0
 EhJg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773093966; x=1773698766; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQSe2YqM4taFyZW7Fl18ntWD1f3i6CTFSEMckg/bKo4=;
 b=jC0WaLVwoKOC59pFK/mkGZKf7Zo7ZCfV2GL2AJHzAwwmnpDQNHJJgMnmEn6dXxEjUS
 u63qfYLv3Gg2Yeu2ElrytaIkFxebAGNsd6wW66RUgRrknvQjGi20/hokJF5UKlC5akcF
 OiotpOhYmMIWqVUEZBEcRBH0xGY8JQ/4VqAmOXpxHuBk6IKYVFYx7PDgespowvTNm75E
 TzO3Vuo2Gh6LyLG9s7njrhRNL6rsb8EYzotljzu+29/GvdkM2kPLcERVgYm2AffAwJby
 VezDnxlo7dMWnL6/25oEfLrcflNcPO9ST62/7BNJyBNkaMXAK5gOuucPsmeAsV4yTnh4
 Nq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773093966; x=1773698766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TQSe2YqM4taFyZW7Fl18ntWD1f3i6CTFSEMckg/bKo4=;
 b=Ir29en1H58YRhPcVpqBtdJZIxSjbiw75W72QF6ybK027TQbuyNB9eZEVgjulkJQiD2
 /GRYvTwNXOjZMSlkN64M3iFwePto00h9e4rSQ0SbQ/kO07Rox+ca6jO5Nl+xdiTSQ41t
 N43dTCyvm31oZ8pN60Q18Dk0rw/qpndupNcI7+hF0FFv7P8JBvybf96Q5n9AjLbnBX0B
 TeiIqkKRLWunJDG5Xb6GwuYqr3zMrvF6IgefP5n240lhG4SJReHtmD8Ne3R4+DKUdnKh
 XwJwMNiKwcoSNLqq2FIHPFt/Qu1osMKEJEAaTJXLh7Qxjf5SiGeW4lrucVsf8HvwKngT
 KVBg==
X-Gm-Message-State: AOJu0YwyE7nK0Jks13r7dzY3eK9XeFyCZxk52unoeiTbgbuktQxNLov/
 WbbBTquLCS2PJ6OX2jruZ4cA1C4U0fKyow6AujEYRFPMat/3rSyMbIKHavn3/amKgIlfR80R4zX
 FxqSwdwD1YYKsxuCrqJigbI0ZNn81kY8=
X-Gm-Gg: ATEYQzwmpB7EsnRRtc6K6nt974PZNBxbGXX8U24M0lo9jJN8SK66hSa7KIyyYoCckdz
 uxymhXOatYE5tgGoADumwvGE5g1pPuDRKiWjAAl5HdkUJ2+q+PCBZIsOX+TLmfyR4UvJLVMovOo
 h8SWer7xY+lP1MeEYB+zCtmJS9TYO5Y/SErMrNHwzuOMZCdxaImQ5C3fhCZ237cI7jlHzLhgwbq
 mobepv/XIQCLoAlLEJ1tzoOGAWFj0hRYZhPpjAe1yW9kyazSgivwqvMcHJA2lFQQg36xM1R1jg0
 N6iqXFunTxV+tF9+nBCLUCNp9VbYH60hterQ2+KtbfZYvdbKN3xMfkJU4LlRkiuj2GBe+Q==
X-Received: by 2002:a05:7022:fa3:b0:127:3480:7ca5 with SMTP id
 a92af1059eb24-128c2dbaca9mr3342630c88.2.1773093965760; Mon, 09 Mar 2026
 15:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260309215052.1417114-1-pratap.nirujogi@amd.com>
In-Reply-To: <20260309215052.1417114-1-pratap.nirujogi@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Mar 2026 18:05:54 -0400
X-Gm-Features: AaiRm51Q_gxl_k6jOdmyx4CCQTObmTeeHehHuap05P69e06VsUlc-Fggcd83ssc
Message-ID: <CADnq5_Ns2bh1nbPrbtBj1iajyp-5mtB7a_0yBv56vzsQRyRwmw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/amdgpu: Fix ISP regression issue in kernel v7.0
To: Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, mlimonci@amd.com,
 christian.koenig@amd.com, rafael.j.wysocki@intel.com, benjamin.chan@amd.com, 
 bin.du@amd.com, king.li@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: D0CE22420E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pratap.nirujogi@amd.com,m:alexander.deucher@amd.com,m:mlimonci@amd.com,m:christian.koenig@amd.com,m:rafael.j.wysocki@intel.com,m:benjamin.chan@amd.com,m:bin.du@amd.com,m:king.li@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email,mail.gmail.com:mid,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 5:59=E2=80=AFPM Pratap Nirujogi <pratap.nirujogi@amd=
.com> wrote:
>
> Add NULL pointer checks for dev->type before accessing
> dev->type->name in ISP genpd add/remove functions to
> prevent kernel crashes. Also add MODULE_SOFTDEP to ensure
> ISP driver dependencies are loaded in correct order.
>
> The regression was introduced in kernel v7.0 where MFD ISP
> device enumeration doesn't complete by the time it is added
> to gendp. The timing of ISP device enumeration has changed
> because of the changes in registering the device sources in
> the device hierarchy.
>
> Co-developed-by: Bin Du <Bin.Du@amd.com>
> Fixes: 02c057ddefef ("ACPI: video: Convert the driver to a platform one")

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/5021

I'm not too familiar with the underlying issue.  Does this actually
result in the driver loading properly or does it just prevent a
segfault?

Alex

> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 1 +
>  drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 95d26f086d545..920595f0d22ca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -3212,3 +3212,4 @@ module_exit(amdgpu_exit);
>  MODULE_AUTHOR(DRIVER_AUTHOR);
>  MODULE_DESCRIPTION(DRIVER_DESC);
>  MODULE_LICENSE("GPL and additional rights");
> +MODULE_SOFTDEP("post: amd_isp4_capture i2c-designware-amdisp pinctrl-amd=
isp");
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c b/drivers/gpu/drm/am=
d/amdgpu/isp_v4_1_1.c
> index b3590b33cab9e..485ecdec96184 100644
> --- a/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
> @@ -129,7 +129,7 @@ static int isp_genpd_add_device(struct device *dev, v=
oid *data)
>         if (!pdev)
>                 return -EINVAL;
>
> -       if (!dev->type->name) {
> +       if (!dev->type || !dev->type->name) {
>                 drm_dbg(&adev->ddev, "Invalid device type to add\n");
>                 goto exit;
>         }
> @@ -165,7 +165,7 @@ static int isp_genpd_remove_device(struct device *dev=
, void *data)
>         if (!pdev)
>                 return -EINVAL;
>
> -       if (!dev->type->name) {
> +       if (!dev->type || !dev->type->name) {
>                 drm_dbg(&adev->ddev, "Invalid device type to remove\n");
>                 goto exit;
>         }
> --
> 2.43.0
>

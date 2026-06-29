Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R6kLLlrVQmo7EAoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 22:28:10 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C0A6DEA53
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 22:28:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=O26im3yI;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6E810EA2F;
	Mon, 29 Jun 2026 20:28:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com
 [74.125.82.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E4510EA2F
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jun 2026 20:28:06 +0000 (UTC)
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-30ca8c693a9so236308eec.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jun 2026 13:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782764885; cv=none;
 d=google.com; s=arc-20260327;
 b=G7nDCikTJF6Sn9hBiPh2yH2FenmRqdOcGRwpW4JIuP8xLkA9lfpMQ1PvDHv/kuQI+4
 iMOydPPsQzWfC/SCKaCXnODpXjFo3+gzac4Lxq1dvMRQGf9dRYweY5snC8MNfO+64fN8
 Mc4y9d8vLHkeWO5fNLUHy1K8vdYUxVEYqjGDvYbXupmVf0HLqyM957QqsiYVn8X/FXHL
 Nsm9z4Q3cwDPg1dK4f3N1F7zjXaPGXcgWs4g1cKojeS/8t9Ekr/fvG2t3t9kW1TTBt0+
 2W+StxFkZ4a6Syu070SAso5nhiRehCvBRGbZd1d9eguRIBM0xIRpfzfTufKAGzldQDWA
 AcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NjvWzmrmaCsmvd+lLXwMyG/Te7sQOr2NKkOchdsSK/U=;
 fh=IY98SR0cNO93Tj0qH750yd04bAXFkNbDKtBTzSqo1Bw=;
 b=BTFXCPvIX1Y4Xq7gN3ItXn9h5VBTwBNEsWw9s4oiDYruW7MGzOz4FUFN9LKX4PXcq4
 FuxOdC3Ai395Pmt1fU/7EwV6M03D8+ELJAyxcMwB9ISrTQh391bHheJdL1LhF0W6CbN2
 f2qjaHGSZvFyM8hHmVl4VefBZqy/Jow/L6j7+ocNZrl3xb8HM3sJrDcPneP6fHpaAOpV
 N8ZiKi6LnJxfiK/D8kzUaGPf/vhDN9CQYsZrXvjXz2ta7kuF8rSdlB4pkJVxG5vbcy2b
 eoGjbHA9i4Dt/1xjq3X/HLtM1zZGtq7gwKn18xFZPQi83FKjh2VFZpAYIS4T2aGJZciP
 t4Ig==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782764885; x=1783369685; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NjvWzmrmaCsmvd+lLXwMyG/Te7sQOr2NKkOchdsSK/U=;
 b=O26im3yIYqKxh349awvoniEEKH0UJocxk+VbHQ+ntcgOt6hOveR+4iJ+Cl3uAM5J3T
 1h5bCdUOEnrlA+jjruJF2DXXDOBz6RwElICX8PL6Jb0p5FFvMu70DzsZKBBizOWSblx3
 4QWoOr0ymo3A+8ELVnQaK05ijWU1J2T60Mzq+XOMO5ExfC4klQLe3R6VUGuuesu474nf
 vZvKmvYa0baAvA28cP18lNcYTIOVqJGxxYwi2l9O8GXYh6lppdhTyMUBFZNkSCwXmAga
 o/OVVZ2qP1xXoPEL8qEQSC2ICAox8D3c3wIZaFscPDO+WVMZNfEy1tudvTX03eC0IBm4
 zOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782764885; x=1783369685;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NjvWzmrmaCsmvd+lLXwMyG/Te7sQOr2NKkOchdsSK/U=;
 b=iMBbPHrFwomP9uxQammkPq1CpUENIofKIMZeAscsqGFzjBqXyFOIbVEUV/lqNwpWI/
 pvHbePeIJGRuE/r6yryAbf4xbu4ptVgIGxXOZkym8C5VIpQXCLKLaSctQbqlqblEAkBn
 hLFKKS387h8GS5G/XDR1Zlc0M32JW+fZyKn83NNWg6ZyhddzymTCws3hs1WoLzvGU324
 srPNRzD1ma71IPcSMQ+rO3xzxsBdEx+oQcYehKWE2E5YysEwYSvUM4ReHjS3bQQyz9gA
 Z4wWfhoF8htILqplVGQF1KPTVJsUMzsm5+Sa6mxP2yrXVCbLuqdJxgSysNK0RZRDYyuV
 w6VA==
X-Gm-Message-State: AOJu0YxTl3NnlAPN/w4LIDk/DBU6PuDG5rS4O9jcdiIVoyO4jZp3uAku
 LThyznTSkWb7L3LXDGm+Mv/O+cpPqUbgCkiQYhX3icSnYXsYd+3Uj8dxQCyOoV5Pc7nXC74X+2b
 dE1BbbYtczRorr/jrSvRGPG/PaJ1g42ALig==
X-Gm-Gg: AfdE7cl/HNsdnJGF9JIfkDTTKwgXVWApkE19WpTuM552P8x7hJJXzXHm+mc/0D+Jsst
 gyGnQvyfjLMQKkPIekHhnXc6ol8f38Ad/DvoPNrQKdB/q55BZlW1zgOpaXP5IxuH38QYnUGc67P
 i20MUQUmcBJlkfUaL6A2qyHVbVBs0t/UHODes/E18psS7rwrCu0HfoBib4RW2Gj224hntv7/vWq
 DWMK3dJWBANQzmaHux1FA25/JYunLGZyfn/hj66bfVtzrUEogNGt0p+m5drg6L3WLzuWMKhD1O8
 P+lsJ4p1LU+QxKxj+I8+/AZpsa0eJC1Ru7RxFW9JjIFnH2SuiJvcyJN17BM=
X-Received: by 2002:a05:7022:23a8:b0:137:ec1a:f405 with SMTP id
 a92af1059eb24-13b2a0b3f9emr310614c88.0.1782764885346; Mon, 29 Jun 2026
 13:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260618204550.753250-1-alexander.deucher@amd.com>
 <20260618204550.753250-2-alexander.deucher@amd.com>
In-Reply-To: <20260618204550.753250-2-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Jun 2026 16:27:52 -0400
X-Gm-Features: AVVi8Cc2EumYGAKHd1KKr82CaPi5PWxyDt-wXOkJHeWt0fgZS7l57jy-vnNipyE
Message-ID: <CADnq5_PNXLwpcZCHF+q9ZLMgHwq5DWK=Z6BzR+VRGi9KPUE=9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: update mmhub 4.2.0 client list
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7C0A6DEA53

Ping?

On Thu, Jun 18, 2026 at 4:54=E2=80=AFPM Alex Deucher <alexander.deucher@amd=
.com> wrote:
>
> Update to the proper client list for mmhub 4.2.0.
>
> v2: fix typo (Alex)
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/mmhub_v4_2_0.c | 65 ++++++++++++-----------
>  1 file changed, 33 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v4_2_0.c b/drivers/gpu/drm/=
amd/amdgpu/mmhub_v4_2_0.c
> index 49b7f16a941f6..5827c758b373d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v4_2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v4_2_0.c
> @@ -36,40 +36,41 @@
>
>  static const char *mmhub_client_ids_v4_2_0[][2] =3D {
>         [0][0] =3D "VMC",
> -       [4][0] =3D "DCEDMC",
> -       [5][0] =3D "DCEVGA",
> -       [6][0] =3D "MP0",
> -       [7][0] =3D "MP1",
> +       [2][0] =3D "MPNHT",
> +       [7][0] =3D "MPIFOE",
>         [8][0] =3D "MPIO",
> -       [16][0] =3D "HDP",
> -       [17][0] =3D "LSDMA",
> -       [18][0] =3D "JPEG",
> -       [19][0] =3D "VCNU0",
> -       [21][0] =3D "VSCH",
> -       [22][0] =3D "VCNU1",
> -       [23][0] =3D "VCN1",
> -       [32+20][0] =3D "VCN0",
> -       [2][1] =3D "DBGUNBIO",
> -       [3][1] =3D "DCEDWB",
> -       [4][1] =3D "DCEDMC",
> -       [5][1] =3D "DCEVGA",
> -       [6][1] =3D "MP0",
> -       [7][1] =3D "MP1",
> +       [11][0] =3D "JPEG0",
> +       [12][0] =3D "VCN0",
> +       [13][0] =3D "VCNU0",
> +       [14][0] =3D "VSCH0",
> +       [15][0] =3D "LSDMA",
> +       [32+5][0] =3D "MPRAS",
> +       [32+6][0] =3D "MP1",
> +       [32+7][0] =3D "MP0",
> +       [32+11][0] =3D "JPEG1",
> +       [32+12][0] =3D "VCN1",
> +       [32+13][0] =3D "VCNU1",
> +       [32+14][0] =3D "VSCH1",
> +       [2][1] =3D "MPNHT",
> +       [3][1] =3D "DBGU0",
> +       [7][1] =3D "MPIFOE",
>         [8][1] =3D "MPIO",
> -       [10][1] =3D "DBGU0",
> -       [11][1] =3D "DBGU1",
> -       [12][1] =3D "DBGU2",
> -       [13][1] =3D "DBGU3",
> -       [14][1] =3D "XDP",
> -       [15][1] =3D "OSSSYS",
> -       [16][1] =3D "HDP",
> -       [17][1] =3D "LSDMA",
> -       [18][1] =3D "JPEG",
> -       [19][1] =3D "VCNU0",
> -       [20][1] =3D "VCN0",
> -       [21][1] =3D "VSCH",
> -       [22][1] =3D "VCNU1",
> -       [23][1] =3D "VCN1",
> +       [10][1] =3D "UTCL2_NHT",
> +       [11][1] =3D "JPEG0",
> +       [12][1] =3D "VCN0",
> +       [13][1] =3D "VCNU0",
> +       [14][1] =3D "VSCH0",
> +       [15][1] =3D "LSDMA",
> +       [32+3][1] =3D "DBGU1",
> +       [32+4][1] =3D "DBGU2",
> +       [32+5][1] =3D "MPRAS",
> +       [32+6][1] =3D "MP1",
> +       [32+7][1] =3D "MP0",
> +       [32+8][1] =3D "IH",
> +       [32+11][1] =3D "JPEG1",
> +       [32+12][1] =3D "VCN1",
> +       [32+13][1] =3D "VCNU1",
> +       [32+14][1] =3D "VSCH1",
>  };
>
>  static int mmhub_v4_2_0_get_xgmi_info(struct amdgpu_device *adev)
> --
> 2.54.0
>

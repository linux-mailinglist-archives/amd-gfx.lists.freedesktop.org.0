Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEQlFiRCvWn28AIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Mar 2026 13:48:36 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0BB2DA7EB
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Mar 2026 13:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4511B10EAD8;
	Fri, 20 Mar 2026 12:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Li8/pXHT";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE2810EAB9;
 Fri, 20 Mar 2026 12:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kEnWwn4hCL/bKIi4frW8u1y9gr96rd7KnbMzf+7KM8Y=; b=Li8/pXHTzlSfU5VAjZY5WKsJtk
 lCzyyKlgOTd7ykcZTq9lMLJ6cC4I4Qxqiuvbrt+6jcZmkvVyuiOzipFt3qH4tr3LPw6kAu0nWgd5V
 /UM8blvv8pFr6PbQe91ulzOM/Yz8mIsrHEkGycQO4esmaan5bG7QrKcdRMEEGWaGbLE9JGRNsHl8B
 c/9HYpxC9fPweJK9QvMVcvntpm6nKLJIwybRrSSUp+62cSIsn8ZwSlEpqi+HbCrLXorQ2jTamUcYg
 kgpaDUEITuH5tiaqi+sC2H8ZmDAjvulf/wzSzZzpZD3LF9sJlJhEraxoWMvsQpw+ULaIiK4AVLcKZ
 bW7xNDVQ==;
Received: from [186.208.74.38] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1w3ZGb-003nrM-1L; Fri, 20 Mar 2026 13:47:53 +0100
Message-ID: <f993cd33-cb39-4fb4-9dbb-42abd22c3112@igalia.com>
Date: Fri, 20 Mar 2026 09:47:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/drm_atomic: duplicate colorop states if plane
 color pipeline in use
To: Maxime Ripard <mripard@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, contact@emersion.fr,
 sebastian.wick@redhat.com, harry.wentland@amd.com, daniels@collabora.com,
 Alex Hung <alex.hung@amd.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Xaver Hugl <xaver.hugl@kde.org>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
References: <20260318163629.300627-1-mwen@igalia.com>
 <20260319-nocturnal-mighty-chupacabra-87cbd0@houat>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260319-nocturnal-mighty-chupacabra-87cbd0@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,emersion.fr,redhat.com,amd.com,collabora.com,intel.com,kde.org,lists.freedesktop.org,igalia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.874];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email,igalia.com:mid,amd.com:email]
X-Rspamd-Queue-Id: CC0BB2DA7EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 19/03/2026 07:00, Maxime Ripard wrote:
> Hi Melissa,
>
> On Wed, Mar 18, 2026 at 01:27:11PM -0300, Melissa Wen wrote:
>> For suspend/resume to work correctly, do for colorop state the same we
>> do for plane/crtc/connector states: duplicate the state of colorops in a
>> color pipeline if it's in use by a given plane when suspending and
>> restore cached colorop states when resuming.
>>
>> Fixes: 2afc3184f3b3 ("drm/plane: Add COLOR PIPELINE property")
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>> Reviewed-by: Alex Hung <alex.hung@amd.com>
>> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
> Only slightly related to this patch itself, so this discussion must not
> block merging this patch.
>
> I've been looking at revamping the state allocation / reset recently and
> came across the colorop. It's not clear to me if it's something that
> should be expected to be reset across a suspend/resume cycle or if it's
> something that should be maintained across that cycle.
>
> What is your opinion on that?

Hi Maxime,

I understand colorop should follow the same lifecycle of plane, since 
colorop
is associated with a plane and represent the color configuration of a given
plane state. So, I think it should be preserved and restored in a
suspend/resume cycle.

You mentioned about "revamping state allocation/reset", is there already a
public link for this work that I can take a look?

Melissa

>
> Thanks!
> Maxime


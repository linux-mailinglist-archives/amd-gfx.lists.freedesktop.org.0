Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF9E9615D4
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2024 19:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B70710E3DE;
	Tue, 27 Aug 2024 17:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="I4sk7ZrT";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A5D10E3E1;
 Tue, 27 Aug 2024 17:49:54 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 8B351C4348;
 Tue, 27 Aug 2024 17:49:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 629E8C0004;
 Tue, 27 Aug 2024 17:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724780989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1xCBUsq2RERdX+M6VmGn1Hzr02bh7z4+tA3CK6g7hIA=;
 b=I4sk7ZrT1ikKesOrGip0ARraoFAZ0VNAnDdZVERqHU4ty9wkYNE5FPVJd3HFe3E42w4kFc
 M+3IV0U4CnEAQkNHnHFMNAQ747aZruzkusthBchUW5PUXVsIIocu9MrBO4x6Rav3v5E6xk
 zGolPNJFaR//lFiZU32J24KV4errQ1MbZIjsn7K9zI2ALlal8uueRlrWAgyb8TRVZcuMFR
 eZRPfQ52x6f8pJbxyJc/eLOLGykT/uomxIA0hlzSE+1A7R6sgo0b/Vjx856ay/PB3efhDr
 WVlTlMh6JlTPE0sFmy8dfNkB3Q4TMRFBJPWLCrrCx4cJKeg3zTYSO/qz0BBNSQ==
Date: Tue, 27 Aug 2024 19:49:48 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 05/44] drm/colorop: Introduce new drm_colorop mode
 object
Message-ID: <Zs4RvI2QAVzm0m9K@louis-chauvet-laptop>
References: <20240819205714.316380-1-harry.wentland@amd.com>
 <20240819205714.316380-6-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240819205714.316380-6-harry.wentland@amd.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 19/08/24 - 16:56, Harry Wentland a �crit :

[...]

> +#ifndef __DRM_COLOROP_H__
> +#define __DRM_COLOROP_H__
> +
> +#include <drm/drm_mode_object.h>
> +#include <drm/drm_mode.h>
> +#include <drm/drm_property.h>
> +
> +/**
> + * struct drm_colorop_state - mutable colorop state
> + */
> +struct drm_colorop_state {
> +	/** @colorop: backpointer to the colorop */
> +	struct drm_colorop *colorop;
> +
> +	/* colorop properties */

Can you add a comment like this, so it is clear that not all the fields 
are valid and only a few of them will be used.

	/*
	 * Color properties
	 *
	 * The following fields are not always valid, their usage depends
	 * on the colorop type. See their associated comment for more 
	 * information.
	 */

> +
> +	/** @state: backpointer to global drm_atomic_state */
> +	struct drm_atomic_state *state;
> +};
> +
> +/**
> + * struct drm_colorop - DRM color operation control structure
> + *
> + * A colorop represents one color operation. They can be chained via
> + * the 'next' pointer to build a color pipeline.
> + */
> +struct drm_colorop {
> +	/** @dev: parent DRM device */
> +	struct drm_device *dev;
> +
> +	/**
> +	 * @head:
> +	 *
> +	 * List of all colorops on @dev, linked from &drm_mode_config.colorop_list.
> +	 * Invariant over the lifetime of @dev and therefore does not need
> +	 * locking.
> +	 */
> +	struct list_head head;
> +
> +	/**
> +	 * @index: Position inside the mode_config.list, can be used as an array
> +	 * index. It is invariant over the lifetime of the colorop.
> +	 */
> +	unsigned index;
> +
> +	/** @base: base mode object */
> +	struct drm_mode_object base;
> +
> +	/**
> +	 * @plane:
> +	 *
> +	 * The plane on which the colorop sits. A drm_colorop is always unique
> +	 * to a plane.
> +	 */
> +	struct drm_plane *plane;
> +
> +	/**
> +	 * @state:
> +	 *
> +	 * Current atomic state for this colorop.
> +	 *
> +	 * This is protected by @mutex. Note that nonblocking atomic commits
> +	 * access the current colorop state without taking locks.
> +	 */
> +	struct drm_colorop_state *state;
> +
> +	/* colorop properties */

Maybe the same kind of comment here?

> +	/** @properties: property tracking for this colorop */
> +	struct drm_object_properties properties;
> +
> +};
> +

[...]

Louis Chauvet

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A93A441DF
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Feb 2025 15:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159C710E6BC;
	Tue, 25 Feb 2025 14:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RPz1VEhl";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C14810E6BC;
 Tue, 25 Feb 2025 14:09:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54ACE432E9;
 Tue, 25 Feb 2025 14:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740492580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jboJZxaLiwbQZxHEn/1o4Rkr4gtd5yONqbc5i6dqnAI=;
 b=RPz1VEhlrjOesLe5sFyYR+XELdmz+YE9fkFCkHuMYEcVo4ufkeh6mZPrM06ulm/ODSgB74
 otwC7cvbjkDeR9MSiYOJIXzF0tgnwJPiAjJmiZV6dVymqp8wdwp2U7RcRvXGatcVuGH0DG
 NDZPZnPsUwVTdTTJDhpsX2fACpu1gBczFbxzjre/SFJV7dY/UetHu5FV2jsaDct9eLaxlZ
 7mJpUBjVuJa4Z+WD2cB6zvuz4M7jDRK6QFEeceErJEEYSHrcZzjKz1eGBzlKzTsTMwKtPB
 1BGUzb+/nhQBK1z+jLNDhvxgZE5bQxTy9HC2anQruTVqUWVbTDwj2Z4Yb57zWg==
Date: Tue, 25 Feb 2025 15:09:38 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 07/63] dyndbg: split param_set_dyndbg_classes to _module
 & wrapper fns
Message-ID: <b1db3b24-958e-4be8-b979-7c4954a3a678@bootlin.com>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org,
 intel-gfx-trybot@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-8-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250125064619.8305-8-jim.cromie@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeiffduffeivdejgfejheeuudekkedvjeeuffegfefghfffkeelgffgieevudejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehjihhmrdgtrhhomhhivgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsggrrhhonhesrghkrghmrghirdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnr
 dhorhhgpdhrtghpthhtohepuhhkrghsiigssegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehinhhtvghlqdhgfhigqdhtrhihsghotheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghmugdqghhfgieslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
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



Le 25/01/2025 � 07:45, Jim Cromie a �crit�:
> Split api-fn: param_set_dyndbg_classes(), adding modname param and
> passing NULL in from api-fn.
> 
> The new arg allows caller to specify that only one module is affected
> by a prdbgs update.  This selectivity will be used later to narrow the
> scope of changes made.
> 
> no functional change.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   lib/dynamic_debug.c | 37 ++++++++++++++++++++++---------------
>   1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index 8adb81e75a16..9adcb9fa7110 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -711,18 +711,9 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
>   	return 0;
>   }
>   
> -/**
> - * param_set_dyndbg_classes - class FOO >control
> - * @instr: string echo>d to sysfs, input depends on map_type
> - * @kp:    kp->arg has state: bits/lvl, map, map_type
> - *
> - * Enable/disable prdbgs by their class, as given in the arguments to
> - * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
> - * levels by bitpos.
> - *
> - * Returns: 0 or <0 if error.
> - */
> -int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
> +static int param_set_dyndbg_module_classes(const char *instr,
> +					   const struct kernel_param *kp,
> +					   const char *modnm)
>   {
>   	const struct ddebug_class_param *dcp = kp->arg;
>   	const struct ddebug_class_map *map = dcp->map;
> @@ -759,8 +750,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
>   				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
>   			inrep &= CLASSMAP_BITMASK(map->length);
>   		}
> -		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
> -		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, NULL);
> +		v2pr_info("bits:0x%lx > %s.%s\n", inrep, modnm ?: "*", KP_NAME(kp));
> +		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, modnm);
>   		*dcp->bits = inrep;
>   		break;
>   	case DD_CLASS_TYPE_LEVEL_NUM:
> @@ -773,7 +764,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
>   		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
>   		new_bits = CLASSMAP_BITMASK(inrep);
>   		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
> -		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, NULL);
> +		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, modnm);
>   		*dcp->lvl = inrep;
>   		break;
>   	default:
> @@ -782,6 +773,22 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
>   	vpr_info("%s: total matches: %d\n", KP_NAME(kp), totct);
>   	return 0;
>   }
> +
> +/**
> + * param_set_dyndbg_classes - class FOO >control
> + * @instr: string echo>d to sysfs, input depends on map_type
> + * @kp:    kp->arg has state: bits/lvl, map, map_type
> + *
> + * Enable/disable prdbgs by their class, as given in the arguments to
> + * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
> + * levels by bitpos.
> + *
> + * Returns: 0 or <0 if error.
> + */
> +int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
> +{
> +	return param_set_dyndbg_module_classes(instr, kp, NULL);
> +}
>   EXPORT_SYMBOL(param_set_dyndbg_classes);
>   
>   /**

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


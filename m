Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E232B913E8
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Sep 2025 14:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B400710E49B;
	Mon, 22 Sep 2025 12:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.b="R8bDYw7u";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fra-out-012.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 (fra-out-012.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 [52.57.120.243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B418C10E412
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Sep 2025 10:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1758537676; x=1790073676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k0dUe76w+6n5/NfsPbyefGVCom+xh3GGcFcV3Olhmks=;
 b=R8bDYw7urEQe9WpRF3JViF4jsVQC5udNK4ASUpFn0q+1LtBFYZMrDTRj
 LHPXVgwcCZ/pZbJWNEfBeBoeagAUikdP5bRVmvr+nQEBPZUdsRqYFPrE/
 X1N7uv6wuBRcFhjlNZfqLRcG7aPb/PI4ONGYuJQA9ZWV7skK3UKKEajWb
 LXoCs5Hu7KwfLEH+uSGGWlENZe7QuBGbJJY89DJEF+oxl6FfdSEwoA3Mx
 77lXR05hO/4nG52cmbPRwpxXoyjNcp84sq3tRe8d/aR293BVksvViWsFU
 PYi5+YRKNRjMOJoSxDPHnCF+IEhXB4aU4UKbBbSwfN5tqa3k/lYWutElr w==;
X-CSE-ConnectionGUID: RZeahlREQeWugdA7d+vJ1A==
X-CSE-MsgGUID: enu9hqGeQxCBUbcuQO4jhw==
X-IronPort-AV: E=Sophos;i="6.18,285,1751241600"; 
   d="scan'208";a="2375391"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
 by internal-fra-out-012.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 10:41:15 +0000
Received: from EX19MTAEUC002.ant.amazon.com [54.240.197.228:26057]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.0.240:2525]
 with esmtp (Farcaster)
 id de0fe1e7-960b-4bf3-87d3-6b5837bc9feb; Mon, 22 Sep 2025 10:41:15 +0000 (UTC)
X-Farcaster-Flow-ID: de0fe1e7-960b-4bf3-87d3-6b5837bc9feb
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Mon, 22 Sep 2025 10:41:01 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D018EUA004.ant.amazon.com (10.252.50.85) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Mon, 22 Sep 2025
 10:40:34 +0000
From: Eliav Farber <farbere@amazon.com>
To: <richard@nod.at>, <anton.ivanov@cambridgegreys.com>,
 <johannes@sipsolutions.net>, <dave.hansen@linux.intel.com>,
 <luto@kernel.org>, <peterz@infradead.org>, <tglx@linutronix.de>,
 <mingo@redhat.com>, <bp@alien8.de>, <x86@kernel.org>, <hpa@zytor.com>,
 <tony.luck@intel.com>, <qiuxu.zhuo@intel.com>, <james.morse@arm.com>,
 <mchehab@kernel.org>, <rric@kernel.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <evan.quan@amd.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <jdelvare@suse.com>,
 <linux@roeck-us.net>, <linus.walleij@linaro.org>,
 <dmitry.torokhov@gmail.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
 <samuel@sholland.org>, <agk@redhat.com>, <snitzer@kernel.org>,
 <dm-devel@lists.linux.dev>, <mailhol.vincent@wanadoo.fr>,
 <wg@grandegger.com>, <mkl@pengutronix.de>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
 <mcoquelin.stm32@gmail.com>, <krzysztof.kozlowski@linaro.org>,
 <malattia@linux.it>, <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
 <markgross@kernel.org>, <artur.paszkiewicz@intel.com>, <jejb@linux.ibm.com>,
 <martin.petersen@oracle.com>, <sakari.ailus@linux.intel.com>,
 <gregkh@linuxfoundation.org>, <clm@fb.com>, <josef@toxicpanda.com>,
 <dsterba@suse.com>, <luc.vanoostenryck@gmail.com>, <rostedt@goodmis.org>,
 <mhiramat@kernel.org>, <pmladek@suse.com>,
 <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>,
 <senozhatsky@chromium.org>, <minchan@kernel.org>,
 <akpm@linux-foundation.org>, <dsahern@kernel.org>, <shuah@kernel.org>,
 <keescook@chromium.org>, <wad@chromium.org>, <farbere@amazon.com>,
 <David.Laight@ACULAB.COM>, <arnd@kernel.org>, <linux-um@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-hwmon@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-media@vger.kernel.org>, <linux-can@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-btrfs@vger.kernel.org>,
 <linux-sparse@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <bpf@vger.kernel.org>, <stable@vger.kernel.org>
CC: Christoph Hellwig <hch@infradead.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, "Jens
 Axboe" <axboe@kernel.dk>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Mateusz Guzik <mjguzik@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Pedro Falcato <pedro.falcato@gmail.com>
Subject: [PATCH 15/15 6.6.y] minmax.h: remove some #defines that are only
 expanded once
Date: Mon, 22 Sep 2025 10:32:41 +0000
Message-ID: <20250922103241.16213-16-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922103241.16213-1-farbere@amazon.com>
References: <20250922103241.16213-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D040UWB004.ant.amazon.com (10.13.138.91) To
 EX19D018EUA004.ant.amazon.com (10.252.50.85)
X-Mailman-Approved-At: Mon, 22 Sep 2025 12:52:01 +0000
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

From: David Laight <David.Laight@ACULAB.COM>

[ Upstream commit 2b97aaf74ed534fb838d09867d09a3ca5d795208 ]

The bodies of __signed_type_use() and __unsigned_type_use() are much the
same size as their names - so put the bodies in the only line that expands
them.

Similarly __signed_type() is defined separately for 64bit and then used
exactly once just below.

Change the test for __signed_type from CONFIG_64BIT to one based on gcc
defined macros so that the code is valid if it gets used outside of a
kernel build.

Link: https://lkml.kernel.org/r/9386d1ebb8974fbabbed2635160c3975@AcuMS.aculab.com
Signed-off-by: David Laight <david.laight@aculab.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Pedro Falcato <pedro.falcato@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 include/linux/minmax.h | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 2bbdd5b5e07e..eaaf5c008e4d 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -46,10 +46,8 @@
  * comparison, and these expressions only need to be careful to not cause
  * warnings for pointer use.
  */
-#define __signed_type_use(ux) (2 + __is_nonneg(ux))
-#define __unsigned_type_use(ux) (1 + 2 * (sizeof(ux) < 4))
 #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
-	__signed_type_use(ux) : __unsigned_type_use(ux))
+	(2 + __is_nonneg(ux)) : (1 + 2 * (sizeof(ux) < 4)))
 
 /*
  * Check whether a signed value is always non-negative.
@@ -57,7 +55,7 @@
  * A cast is needed to avoid any warnings from values that aren't signed
  * integer types (in which case the result doesn't matter).
  *
- * On 64-bit any integer or pointer type can safely be cast to 'long'.
+ * On 64-bit any integer or pointer type can safely be cast to 'long long'.
  * But on 32-bit we need to avoid warnings about casting pointers to integers
  * of different sizes without truncating 64-bit values so 'long' or 'long long'
  * must be used depending on the size of the value.
@@ -66,12 +64,12 @@
  * them, but we do not use s128 types in the kernel (we do use 'u128',
  * but they are handled by the !is_signed_type() case).
  */
-#ifdef CONFIG_64BIT
-  #define __signed_type(ux) long
+#if __SIZEOF_POINTER__ == __SIZEOF_LONG_LONG__
+#define __is_nonneg(ux) statically_true((long long)(ux) >= 0)
 #else
-  #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L))
+#define __is_nonneg(ux) statically_true( \
+	(typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
 #endif
-#define __is_nonneg(ux) statically_true((__signed_type(ux))(ux) >= 0)
 
 #define __types_ok(ux, uy) \
 	(__sign_use(ux) & __sign_use(uy))
-- 
2.47.3


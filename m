Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9CF57E8CA
	for <lists+amd-gfx@lfdr.de>; Fri, 22 Jul 2022 23:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E56941A3;
	Fri, 22 Jul 2022 21:20:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 571 seconds by postgrey-1.36 at gabe;
 Fri, 22 Jul 2022 12:41:48 UTC
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7E81123D6
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Jul 2022 12:41:48 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lq82f5Q7Kz4xG6;
 Fri, 22 Jul 2022 22:32:09 +1000 (AEST)
From: Michael Ellerman <michael@ellerman.id.au>
To: Dan =?utf-8?Q?Hor=C3=A1k?= <dan@danny.cz>,
 amd-gfx@lists.freedesktop.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] amdgpu: re-enable DCN for ppc64le
In-Reply-To: <20220722082122.571974-1-dan@danny.cz>
References: <20220722082122.571974-1-dan@danny.cz>
Date: Fri, 22 Jul 2022 22:32:06 +1000
Message-ID: <87o7xhcoqh.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 22 Jul 2022 21:20:20 +0000
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
Cc: Alex Deucher <alexdeucher@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi Dan,

[ Cc +=3D linuxppc-dev  ]

Dan Hor=C3=A1k <dan@danny.cz> writes:
> Commit d11219ad53dc disabled the DCN driver for all platforms that
> define PPC64 due long build issues during "make allmodconfig" using
> cross-compilation. Cross-compilation defaults to the ppc64_defconfig
> and thus big-endian toolchain configuration. The ppc64le platform uses a
> different ABI and doesn't suffer from the build issues.

Unfortunately it's a bit messier than that.

The build error occurs when the compiler is built to use a 64-bit long
double type.

The ppc64le ABI document says that long double should be 128-bits, but
there are ppc64le compilers out there that are configured to use 64-bit
long double, notably the kernel.org crosstool compilers.

So just testing for CPU_LITTLE_ENDIAN means we'll still get build errors
on those compilers.

But I think we can detect the long double size and key off that. Can you
test the patch below works for you?

cheers


diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7aa12e88c580..e9f8cd50af99 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -281,6 +281,9 @@ config PPC
 	# Please keep this list sorted alphabetically.
 	#
=20
+config PCC_LONG_DOUBLE_128
+	def_bool $(success,test "$(shell,echo __LONG_DOUBLE_128__ | $(CC) -E -P -=
)" =3D 1)
+
 config PPC_BARRIER_NOSPEC
 	bool
 	default y
diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/disp=
lay/Kconfig
index b4029c0d5d8c..ec6771e87e73 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -6,7 +6,7 @@ config DRM_AMD_DC
 	bool "AMD DC - Enable new display engine"
 	default y
 	select SND_HDA_COMPONENT if SND_HDA_CORE
-	select DRM_AMD_DC_DCN if (X86 || PPC64) && !(KCOV_INSTRUMENT_ALL && KCOV_=
ENABLE_COMPARISONS)
+	select DRM_AMD_DC_DCN if (X86 || PPC_LONG_DOUBLE_128) && !(KCOV_INSTRUMEN=
T_ALL && KCOV_ENABLE_COMPARISONS)
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and

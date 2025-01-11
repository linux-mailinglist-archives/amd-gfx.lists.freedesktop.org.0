Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F16AA0A40C
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Jan 2025 15:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7153D10E5AC;
	Sat, 11 Jan 2025 14:09:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 589B610E059
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Jan 2025 07:03:11 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
 by gateway (Coremail) with SMTP id _____8Bx366uF4JnrIFhAA--.20633S3;
 Sat, 11 Jan 2025 15:03:10 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
 by front1 (Coremail) with SMTP id qMiowMBxXcetF4Jn5GMdAA--.55243S3;
 Sat, 11 Jan 2025 15:03:10 +0800 (CST)
Subject: Re: [PATCH v2 0/5] drm/amd/display: Stop control flow if the divisior
 is zero
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <20250106085755.3268-1-yangtiezhu@loongson.cn>
 <21f4f72a-b27f-4389-b345-e1d9cf4c2f06@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 loongarch@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <97d1f078-981d-ed10-7e6f-a9e177298b2e@loongson.cn>
Date: Sat, 11 Jan 2025 15:03:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <21f4f72a-b27f-4389-b345-e1d9cf4c2f06@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qMiowMBxXcetF4Jn5GMdAA--.55243S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFWfXry5Zr1UKr1rGw13KFX_yoW5JrW3pa
 1fGFy7Ar1kJas2y3Z7Z3WruFW3X3yrJF4jgw13uw4ku3W7uFsxWrW3Ja4rGryUCasxC3ya
 vFZ0g3yDXF4vyrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
 x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
 McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
 I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF
 x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r
 1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
 64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
 0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
 0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jYJP_UUUUU=
X-Mailman-Approved-At: Sat, 11 Jan 2025 14:09:38 +0000
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

On 01/11/2025 05:45 AM, Harry Wentland wrote:
> On 2025-01-06 03:57, Tiezhu Yang wrote:
>> As far as I can tell, with the current existing macro definitions, there
>> is no better way to do the minimal and proper changes to stop the control
>> flow if the divisior is zero.
>>
>> In order to keep the current ability for the aim of debugging and avoid
>> printing the warning message twice, it is better to only use ASSERT_BUG()
>> and SPL_ASSERT_BUG() directly after doing the following four steps:
>>
>> (1) Replace ASSERT() with ASSERT_WARN()
>> (2) Replace SPL_ASSERT() with SPL_ASSERT_WARN()
>> (3) Add ASSERT_BUG() macro definition
>> (4) Add SPL_ASSERT_BUG() macro definition
>>
>
> Patches 1-4 create lots of churn across the whole driver for little
> immediate benefit. We should be able to do patch 5 without requiring
> all that churn.

Do you mean to drop the first 4 patches and only do the following
simple changes to replace the current ASSERT() and SPL_ASSERT() with
BUG_ON() directly without considering the aim of debugging? Something
like this:

--- >8 ---

diff --git a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c 
b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
index 88d3f9d7dd55..ec6b194fb093 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
@@ -51,7 +51,7 @@ static inline unsigned long long 
complete_integer_division_u64(
  {
         unsigned long long result;

-       ASSERT(divisor);
+       BUG_ON(divisor);

         result = div64_u64_rem(dividend, divisor, remainder);

diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c 
b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
index 131f1e3949d3..a91dbd076d13 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
@@ -29,7 +29,7 @@ static inline unsigned long long 
spl_complete_integer_division_u64(
  {
         unsigned long long result;

-       SPL_ASSERT(divisor);
+       BUG_ON(divisor);

         result = spl_div64_u64_rem(dividend, divisor, remainder);

or keep the ASSERT() and SPL_ASSERT() definitions as is, just add
ASSERT_BUG() and SPL_ASSERT_BUG() definitions, then replace the
current ASSERT() and SPL_ASSERT() for the two places, that is to
say, drop the first 2 patches and squash the last 3 patches to one
single patch?

Thanks,
Tiezhu


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4296F7CFEB8
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Oct 2023 17:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9EB10E520;
	Thu, 19 Oct 2023 15:53:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 840 seconds by postgrey-1.36 at gabe;
 Thu, 19 Oct 2023 15:52:16 UTC
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DFB10E520
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Oct 2023 15:52:16 +0000 (UTC)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39JFadhM006435; Thu, 19 Oct 2023 15:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=j0R1Ga/kpGsfsZxYDsOKQGw5axBGZpmFvBJQOoMUbIU=;
 b=GbHccPC3f5652sKQHy/rCTbSwZdvRDqPhlrZARyg/uBbQ3htwghs01EZk9vQXiMZ1GmD
 9sy8xQmnlZFD74BQGG05Ueb9OI9WAAf1IrmHHwUNxQC332qnzyY4Tj+n2jpoRmxrYkc2
 WeDa1Dm0/td6cjlpgWmHK0pft+fPJJvwVAlf0/MWeX5LT36I+Bk9YW25QvxV16rU/xfo
 8AWWem0HqL791Vq5LTm3YbSspcyMHAGUgz5QoELfYCzbHvwuoS+rO8A2Md4aoeS5Xmt2
 mR8bisLHydthj/dLUvxrgr/2ltm5GP0Mrls12vdWfQ4ODDTWQ7qopib6tQ4JlOHELK13 sg== 
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tu71q0thp-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 15:38:09 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39JEin6J030742; Thu, 19 Oct 2023 15:32:09 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr7hk1bbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 15:32:09 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39JFW8NC44368204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Oct 2023 15:32:08 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE89020043;
 Thu, 19 Oct 2023 15:32:07 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A2FE20040;
 Thu, 19 Oct 2023 15:32:07 +0000 (GMT)
Received: from osiris (unknown [9.171.41.136])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 19 Oct 2023 15:32:07 +0000 (GMT)
Date: Thu, 19 Oct 2023 17:32:05 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 2dac75696c6da3c848daa118a729827541c89d33
Message-ID: <20231019153205.9160-A-hca@linux.ibm.com>
References: <202310190456.pryB092r-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310190456.pryB092r-lkp@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pLCVHeZl1pGGUcpHU0HZgqokDhWlFOun
X-Proofpoint-GUID: pLCVHeZl1pGGUcpHU0HZgqokDhWlFOun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_14,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 mlxlogscore=702
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190130
X-Mailman-Approved-At: Thu, 19 Oct 2023 15:53:18 +0000
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Oct 19, 2023 at 04:07:35AM +0800, kernel test robot wrote:
> arch/s390/include/asm/ctlreg.h:129:9: warning: array subscript 0 is outside array bounds of 'struct ctlreg[0]' [-Warray-bounds=]
> arch/s390/include/asm/ctlreg.h:80:9: warning: array subscript 0 is outside array bounds of 'struct ctlreg[0]' [-Warray-bounds=]
...
> |-- s390-defconfig
> |   `-- arch-s390-include-asm-ctlreg.h:warning:array-subscript-is-outside-array-bounds-of-struct-ctlreg
...
> s390                                defconfig   gcc  

I'm wondering how this warning can appear in the builds. array-bounds
warnings are explicitly disabled, see init/Kconfig: CC_NO_ARRAY_BOUNDS. And
as expected, if I compile the kernel with gcc, defconfig, and with or
without W=1 the option -Wno-array-bounds is passed to the compiler.

And also as expected I do not see the above warnings.

So something is quite odd here.

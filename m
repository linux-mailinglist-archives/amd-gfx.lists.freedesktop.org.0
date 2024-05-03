Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7274E8BAD36
	for <lists+amd-gfx@lfdr.de>; Fri,  3 May 2024 15:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650DF112A7D;
	Fri,  3 May 2024 13:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PhtnMo/9";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374E710ECCA;
 Fri,  3 May 2024 07:54:00 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4436srbR030347;
 Fri, 3 May 2024 07:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=3mzdCXxXwnn8uCG5UnxaKBkw7nHf6ws+H3ixiga1rf4=; b=Ph
 tnMo/9H5defEBpAiWaXHCbfUbzlzPihxbRvIm/T1sckITy/l1zp8nVhHfFwjUHgQ
 s5Ug37+Kxp/aa2QvM69pIrTfcgt1LpxtwPKFoqhois04amUWjupw9meo8Ak1aio4
 7mLNa2NpGTBtdJNJYexesOmg41tnxkXCqelUU+XoiLwLDG1rF9T5KLjq6qKWtc9A
 cl0zL08qZd5bbsS7WHpW56EZZyJd4oqgwEVL7jykzyNXL2Sms8cA2A5Lf9zH8xTK
 frQMAdINzapOmJ9BvugUip3a1p1h79ZtWP4VOgbFlIWvca95yy14y/YODvEDLSP6
 h2DsazBpJweCZsLjmBAQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xvu2n833h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 May 2024 07:53:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4437rpdi000345
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 May 2024 07:53:51 GMT
Received: from [10.216.13.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 May 2024
 00:53:46 -0700
Message-ID: <a0daf2d5-4c72-4d96-a8d4-b15adb7252d5@quicinc.com>
Date: Fri, 3 May 2024 13:23:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] BUILD REGRESSION
 9c6ecb3cb6e20c4fd7997047213ba0efcf9ada1a
To: Greg KH <gregkh@linuxfoundation.org>
CC: kernel test robot <lkp@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>,
 <amd-gfx@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-arch@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <netdev@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
References: <202405030439.AH8NR0Mg-lkp@intel.com>
 <2024050342-slashing-froth-bcf9@gregkh>
 <d7f7cfae-78d5-41aa-aaf9-0d558cdfcbea@quicinc.com>
 <2024050314-knelt-sandpaper-3884@gregkh>
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <2024050314-knelt-sandpaper-3884@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: on9lyQf9xcE0l1itpmxGZT4JopeFAuC6
X-Proofpoint-ORIG-GUID: on9lyQf9xcE0l1itpmxGZT4JopeFAuC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_04,2024-05-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=707
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405030055
X-Mailman-Approved-At: Fri, 03 May 2024 13:10:22 +0000
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



On 5/3/2024 11:58 AM, Greg KH wrote:
> On Fri, May 03, 2024 at 11:30:50AM +0530, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 5/3/2024 10:42 AM, Greg KH wrote:
>>> Ok, I'm getting tired of seeing these for the USB portion of the tree,
>>> so I went to look for:
>>>
>>> On Fri, May 03, 2024 at 04:44:42AM +0800, kernel test robot wrote:
>>>> |-- arc-randconfig-002-20240503
>>>> |   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
>>>
>>> This warning (same for all arches), but can't seem to find it anywhere.
>>>
>>> Any hints as to where it would be?
>>>
>>
>> Hi Greg,
>>
>>   I think the hw_mode was not removed in hs_phy_setup and left unused.
>>
>>   Thinh reported the same when there was a merge conflict into linux next
>> (that the hw_mode variable was removed in ss_phy_setup and should be removed
>> in hs_phy_setup as well):
>>
>> https://lore.kernel.org/all/20240426213923.tyeddub4xszypeju@synopsys.com/
>>
>>   Perhaps that was missed ?
> 
> Must have been.  I need it in a format that it can be applied in (a
> 2-way diff can't apply...)
> 

I just checked it with W=1 and it is causing the issue:

/local/mnt/workspace/krishna/linux-next/skales_test/skales/kernel/drivers/usb/dwc3/core.c: 
In function 'dwc3_hs_phy_setup':
/local/mnt/workspace/krishna/linux-next/skales_test/skales/kernel/drivers/usb/dwc3/core.c:679:15: 
warning: variable 'hw_mode' set but not used [-Wunused-but-set-variable]
   unsigned int hw_mode;
                ^

I can send a patch to fix it up. Also, just wanted to confirm if  I skip 
the fixes and CC tags as the main patch wasn't yet merged into any 
stable trees ?

Regards,
Krishna,
